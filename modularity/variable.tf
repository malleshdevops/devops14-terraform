variable "aws-region" {
  description = "specifigy the aws region to create infrastructure"
  default     = "us-west-2"
}

variable "subnetid" { //this is list variable
  default = [
    "subnet-0dbd904117cc6b6f4",
  ]
}

variable "cred" {
  default   = "devops13-eks-key"
  sensitive = true
}

variable "ec2-type" {
  description = "ec2 instance type declaration"
  default     = "t2.nano"
  type        = string
  validation {
    condition     = substr(var.ec2-type, 0, 3) == "t2."
    error_message = "The ec2 type value must be a valid instance type, starting with \"t2.\"."
  }

}
