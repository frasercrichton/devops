resource "aws_instance" "timemap_vm" {
  ami             = var.ami
  instance_type   = var.instance_type
  tags            = { Name = var.instance_name }
  key_name        = var.key_name
  security_groups = [aws_security_group.timemap_security_group.name]
  depends_on      = [aws_s3_bucket.timemap-bucket]
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = var.connection_user
    private_key = file(var.private_key_location)
  }
  provisioner "file" {
    source      = "files/assets.sh"
    destination = "/tmp/assets.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/assets.sh",
    "/tmp/assets.sh"]
  }
}


resource "aws_eip" "EC2_IP_address" {
  vpc        = true
  instance   = aws_instance.timemap_vm.id
  depends_on = [aws_instance.timemap_vm]
}

resource "aws_security_group" "timemap_security_group" {
  name        = "timemap-security-group"
  description = "Web Security Group for Timemap EC2"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_route53_zone" "domain_zone" {
  name = var.domain
}

resource "aws_route53_record" "root_domain" {
  zone_id = aws_route53_zone.domain_zone.zone_id
  name    = var.domain
  type    = "A"
  ttl = "300"
  records = [aws_eip.EC2_IP_address.public_ip]
}
