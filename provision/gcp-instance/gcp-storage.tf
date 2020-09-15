resource "google_storage_bucket" "timemap_bucket" {
  name               = var.bucket_name
  bucket_policy_only = true
  cors {
    origin          = [var.cors_origin]
    response_header = ["Content-Type"]
    method          = ["GET"]
    max_age_seconds = 3600
  }
}

resource "google_storage_bucket_iam_policy" "bucket-iam-policy" {
  bucket      = var.bucket_name
  policy_data = data.google_iam_policy.bucket_policy.policy_data
}

data "google_iam_policy" "bucket_policy" {
  depends_on = [google_storage_bucket.timemap_bucket]
  binding {
    role = "roles/storage.objectViewer"
    members = [
      "allUsers"
    ]
  }
}
