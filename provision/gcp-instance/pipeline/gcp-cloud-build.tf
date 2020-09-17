# manual step for now until I can work out the permissions are enabling the Cloud Resource Manager API 
# resource "google_project_service" "enable_cloud_build" {
#   project                    = var.project_name
#   service                    = "cloudbuild.googleapis.com"
#   disable_on_destroy         = true
#   disable_dependent_services = true
# }
# https://github.com/hashicorp/terraform-provider-google/issues/6101
# enable : App Engine Admin API

# assign service account permissions
# this is the cloud build sa:
# 1049767705969@cloudbuild.gserviceaccount.com 
# App Engine 	App Engine Admin 	
	

#  forensic-265906@appspot.gserviceaccount.com 

resource "google_cloudbuild_trigger" "timemap_cloud_build_trigger" {
  provider    = google-beta
  description = "GitHub Repository Trigger ${var.github_owner}/${var.github_timemap_repository} (${var.branch_name})"

  github {
    owner = var.github_owner
    name  = var.github_timemap_repository
    push {
      branch = var.branch_name
    }
  }

  filename = "cloudbuild.yaml"
    # alternatively you can specify here:

  # Remove the filename and substitutions arguments above and uncomment the code below if you'd prefer to define your
  # build steps in Terraform code.
  # build {
  #   # install the app dependencies
  #   step {
  #     name = "gcr.io/cloud-builders/npm"
  #     args = ["install"]
  #   }
  #
  #   # execute the tests
  #   step {
  #     name = "gcr.io/cloud-builders/npm"
  #     args = ["run", "test"]
  #   }
  #
  #   # build an artifact using the docker builder
  #   step {
  #     name = "gcr.io/cloud-builders/docker"
  #     args = ["build", "--build-arg", "NODE_ENV=production", "-t", "gcr.io/$PROJECT_ID/$REPO_NAME:$SHORT_SHA", "."]
  #   }
  #
  #   # push the artifact to a GCR repository
  #   step {
  #     name = "gcr.io/cloud-builders/docker"
  #     args = ["push", "${var.gcr_region}.gcr.io/$PROJECT_ID/$REPO_NAME:$SHORT_SHA"]
  #   }
  #
  #   # deploy the app to a GKE cluster using the `gke-deploy` builder and expose it
  #   # using a load balancer on port 80.
  #   # https://github.com/GoogleCloudPlatform/cloud-builders/tree/master/gke-deploy
  #   step {
  #     name = "gcr.io/cloud-builders/gke-deploy"
  #     args = ["run", "--image=${var.gcr_region}.gcr.io/$PROJECT_ID/$REPO_NAME:$SHORT_SHA", "--location", "${var.location}", "--cluster", "${var.cluster_name}", "--expose", "80"]
  #   }
  # }
}


resource "google_cloudbuild_trigger" "datasheet_cloud_build_trigger" {
  provider    = google-beta
  description = "GitHub Repository Trigger ${var.github_owner}/${var.github_datasheet_server_repository} (${var.branch_name})"

  github {
    owner = var.github_owner
    name  = var.github_datasheet_server_repository
    push {
      branch = var.branch_name
    }
  }

  filename = "cloudbuild.yaml"

}