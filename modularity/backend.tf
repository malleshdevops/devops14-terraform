terraform {
  backend "s3" {
    bucket = "devops14-tf-state-bucket"
    dynamodb_table = "devops14-tf-state-lock-test"
    key    = "terraform.state"
    region = "us-west-2"
  }

}
