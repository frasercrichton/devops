provider "aws" {
  version = "~> 3.5.0"
  profile = "default"
  region  = var.region
 
}

#  assume_role {
#     session_name = "forensic-architecture-admin-role"
#     role_arn     = "arn:aws:iam::994611526795:role/forensic-architecture-admin-role"
#   }

# terraform {
#   required_version = ">= 0.13.1"
# }

#  alias =""
# assume_role {
#     session_name = "forensic-architecture-admin-role"
#     role_arn = "arn:aws:iam::${local.core_accounts.master-id}"
# }

