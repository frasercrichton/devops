data "archive_file" "lambda_archive" {
  type        = "zip"
  source_dir  = "lambda"
  output_path = "zip/lambda.zip"
}
