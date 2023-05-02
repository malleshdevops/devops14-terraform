resource "aws_s3_bucket" "devops14-s3-tf-stage" {
  bucket = "devops14-tf-state-bucket"

  tags = {
    Name        = "statefile"
    Environment = "Dev"
  }
}
