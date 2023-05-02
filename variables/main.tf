terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.62.0"
    }
  }
}

variable "aws-region" {
  description = "specifigy the aws region to create infrastructure"
  default     = "us-west-2"
}
provider "aws" {
  region = var.aws-region
}

variable "subnetid" {
  default = [
    "subnet-0dbd904117cc6b6f4",
    "subnet-0f8333447868ef6e8",
  ]
}

variable "cred" {
  default   = "devops13-eks-key"
  sensitive = true
}

variable "ec2-type" {
  description = "ec2 instance type declaration"
  default     = "t2.micro"
  type        = string
  validation {
    condition     = substr(var.ec2-type, 0, 3) == "t2."
    error_message = "The ec2 type value must be a valid instance type, starting with \"t2.\"."
  }

}
variable "numberofservers" {
  description = "specify the number of ec2 servers which need to be created"
  default     = 1
  type        = number
}

resource "aws_instance" "devops14-ec2-server" {
  ami           = "ami-0747e613a2a1ff483"
  instance_type = var.ec2-type
  #count         = var.numberofservers
  key_name      = var.cred
  for_each = toset(var.subnetid)
  subnet_id     = each.key
  tags = {
    #Name  = "devops14-${count.index}"
    batch = "14"
  }
}
/*
output "ec2-public-ip" {
  value = aws_instance.devops14-ec2-server.public_ip
}
output "ec2-public-dns" {
  value = aws_instance.devops14-ec2-server.public_dns
} */
