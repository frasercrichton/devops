
resource "aws_route53_zone" "domain_zone" {
  name = var.domain
}

resource "aws_route53_record" "root_domain" {
  zone_id = aws_route53_zone.domain_zone.zone_id
  name    = var.domain
  type    = "A"
  ttl     = "300"
  records = [aws_eip.EC2_IP_address.public_ip]
}

data "dns_ns_record_set" "aws" {
  host = var.domain
}
