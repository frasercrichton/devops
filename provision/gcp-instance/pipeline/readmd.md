# Cloud Build Pipeline

The scripts here create infrastructure to support continuous integration and delivery. They work in tandem with repository artefacts like the app.yaml deploy script and some manual steps (like authorising Cloud Build with GitHub) to create a build pipeline.    

## Terraform Managed Infrastructure 

### Providers

In addition to the default providers there's a Google beta provider for the GitHub plugin.

### `gcp-cloud-build.tf`

This script creates Cloud Build triggers for the Timemap and Datasheet-server GitHub repositories. Once these trigger have been applied any code pushed to those repositories will trigger an automated build, test and deploy cycle.

### Variables

project, the github account, repositories and branches that trigger builds.

#TODO: tweak to 

##

## App Engine Deployment

The app engine 

`npm run build`

`app.yaml`

`gcloud app deploy`

Note: 

"App Engine applications cannot be deleted once they're created; you have to delete the entire project to delete the application. Terraform will report the application has been successfully deleted; this is a limitation of Terraform, and will go away in the future. Terraform is not able to delete App Engine applications."


# Pipeline Build and Deploy

`gcloud builds submit`

``
# Trigger a build

https://cloud.google.com/cloud-build/docs/building/build-nodejs


# App Engine Deployment

https://cloud.google.com/cloud-build/docs/deploying-builds/deploy-appengine





## References

https://medium.com/serverlessguru/serverless-ci-cd-cloud-build-e8c09e9a1018
https://dev.to/mfahlandt/nodejs-continuous-deployment-done-with-container-builder-and-kubernetes-engine-in-google-cloud-570p
https://cloud.google.com/source-repositories/docs/quickstart-triggering-builds-with-source-repositories
https://cloud.google.com/kubernetes-engine/docs/tutorials/gitops-cloud-build
https://medium.com/ci-t/how-to-set-up-a-deployment-pipeline-on-gcp-with-cloud-build-and-cloud-functions-88ef485728f9

# Further Reading

https://www.terraform.io/docs/providers/google/r/app_engine_domain_mapping.html
```
resource "google_app_engine_domain_mapping" "domain_mapping" {
  domain_name = "verified-domain.com"

  ssl_settings {
    ssl_management_type = "AUTOMATIC"
  }
}
```