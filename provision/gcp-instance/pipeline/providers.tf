provider "google" {
  version = "~> 3.5.0"
  project = var.project_name
  region  = var.region
}

provider "google-beta" {
  version = "~> 3.5.0"
  project = var.project_name
  region  = var.region
}
