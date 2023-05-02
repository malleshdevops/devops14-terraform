terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.62.0"
    }
   tls = {
      source = "hashicorp/tls"
      version = "4.0.4"
    }
  }
}

provider "aws" {
 region = "us-west-2"
/* access_key = "AKIATTCUQTK57K4EW6WH"
 secret_key = "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"
 profile = "default" */
}

resource "aws_instance" "devops14-ec2-server" {
  ami = "ami-0747e613a2a1ff483"
  instance_type = "t2.micro"
  //count = 2
  key_name = "devops14-aws"
  tags = {
    #Name = "devops14-${count.index}"
    batch = "14"
    test = "devops14"
    Name = "testing"
    project = "terraform"
  }
  lifecycle {
//   prevent_destroy = true
   ignore_changes = [tags]
   create_before_destroy = true
}
}


resource "aws_vpc" "my-vpc-1" {
   cidr_block = "10.0.0.0/26"
  lifecycle {
   create_before_destroy = true
}

}

resource "aws_s3_bucket" "devops14-tf-testing-bucket" {
  bucket = "devops14-tf-testing-bucket"
} 

