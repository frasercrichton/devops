# resource "aws_s3_bucket" "timemap-bucket" {
#   bucket = var.bucket-name
#   cors_rule {
#     allowed_headers = ["*"]
#     allowed_methods = ["GET"]
#     allowed_origins = [var.cors_allowed_origins]
#     max_age_seconds = 3000
#   }

# }

# resource "aws_s3_bucket_policy" "timemap-bucket-policy" {
#   depends_on = [aws_s3_bucket.timemap-bucket]
#   bucket     = var.bucket-name
#   policy     = data.aws_iam_policy_document.policy-document.json
# }

# data "aws_iam_policy_document" "policy-document" {
#   statement {
#     sid    = "PublicRead"
#     effect = "Allow"
#     principals {
#       type        = "AWS"
#       identifiers = ["*"]
#     }
#     actions   = ["s3:GetObject"]
#     resources = [format("arn:aws:s3:::%s/*", var.bucket-name)]
#   }
# }
