variable "region" {
  default = "us-east-1"
}
variable "organisation" {
  description = "Organisation name for tagging."
}
variable "VPC-CIDR-block" {
  description = "CIDR block for VPC."
  default     = "10.0.0.0/16"
}
variable "public_subnet_CIDR_block" {
  description = "CIDR block for Subnet."
  default     = "10.0.0.0/24"
}
variable "availability_zone" {
  description = "Subnet availability zone."
  default     = "us-east-1a"
}
