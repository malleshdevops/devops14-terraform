provider "aws" {
  region = local.region
}

data "aws_availability_zones" "available" {}

locals {
  region = "us-west-2"

  vpc_cidr = "10.0.0.0/16"

}

module "vpc" {
  source           = "terraform-aws-modules/vpc/aws"
  version          = "4.0.1"
  name             = "devops14-tf-vpc"
  cidr             = local.vpc_cidr
  instance_tenancy = "default"

}

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.8.2"
  bucket = "devops15-tf-bucket"
}

/*module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.6.0"
    name = "devops14-tf-alb"

  load_balancer_type = "application"

  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
}*/


