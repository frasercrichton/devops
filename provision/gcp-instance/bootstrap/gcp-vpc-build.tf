# manual step for now until I can work out the permissions are enabling the Cloud Resource Manager API 
resource "google_project_service" "enable_cloud_build" {
  project                    = var.project_name
  service                    = "cloudbuild.googleapis.com"
  disable_on_destroy         = true
  disable_dependent_services = true
}
# https://github.com/hashicorp/terraform-provider-google/issues/6101
# enable : App Engine Admin API

# assign service account permissions
# this is the cloud build sa:
# 1049767705969@cloudbuild.gserviceaccount.com 
# App Engine 	App Engine Admin 	
	
# TODO - create a bucket for the build
#  forensic-265906@appspot.gserviceaccount.com 
# to do:
# create a dedicated service account 
# use it to authorise access to the app engine
