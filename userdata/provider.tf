terraform { //configuration block
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.62.0"
    }
  }
}

provider "aws" { //provider block
  region = var.aws-region
}
