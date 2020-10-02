
resource "aws_route53_zone" "forensic_architecture_base_zone" {
  name = var.domain
}

resource "aws_route53_record" "a_record" {
  name    = var.domain
  type    = "A"
  ttl     = "300"
  zone_id = aws_route53_zone.forensic_architecture_base_zone.zone_id
  records = [aws_eip.EC2_IP_address.public_ip]
}

# resource "aws_route53_record" "cname" {
#   name         = "www.${aws_route53_zone.forensic_architecture_base_zone.name}"
#   type         = "CNAME"
#   ttl          = 300
#   zone_id = aws_route53_zone.forensic_architecture_base_zone.zone_id
#   records      = [aws_route53_zone.forensic_architecture_base_zone.name]

# }

# resource "dns_cname_record" "cname" {
#   zone  = "${var.domain}."
#   name  = "www ${var.domain}"
#   cname = "www.${var.domain}."
#   ttl   = 300
# }

# data "dns_ns_record_set" "aws" {
#   host = var.domain
# }
