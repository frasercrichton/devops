variable "region" {
  default = "us-central1-a"
}
variable "project_name" {
  description = "The name of the GCP Project"
  #  declared in terraform.tfvars 
}

variable "github_owner" {
  description = "The GitHub owner"
  #  declared in terraform.tfvars 
}
variable "github_timemap_repository" {
  description = "Repository name"
  #  declared in terraform.tfvars 
}
variable "github_datasheet_server_repository" {
  description = "Repository name"
  #  declared in terraform.tfvars 
}
variable "branch_name" {
  description = "Git branch name e.g. develop. production, etc."
  #  declared in terraform.tfvars 
}
