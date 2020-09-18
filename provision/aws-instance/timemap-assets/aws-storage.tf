resource "aws_s3_bucket" "timemap_bucket" {
  bucket = var.bucket_name
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = [var.cors_allowed_origins]
    max_age_seconds = 3000
  }

}

resource "aws_s3_bucket_policy" "timemap_bucket_policy" {
  depends_on = [aws_s3_bucket.timemap_bucket]
  bucket     = var.bucket_name
  policy     = data.aws_iam_policy_document.policy_document.json
}

data "aws_iam_policy_document" "policy_document" {
  statement {
    sid    = "PublicRead"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions   = ["s3:GetObject"]
    resources = [format("arn:aws:s3:::%s/*", var.bucket_name)]
  }
}
