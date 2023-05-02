data "aws_vpc" "selected" {
  id = "vpc-03bb16b29cf98b017"
}

output "vpc-data" {
  value = data.aws_vpc.selected.id
}

data "aws_availability_zones" "available" {
  state = "available"
}

output "az-data" {
  value = data.aws_availability_zones.available[*].names
}

data "aws_subnets" "example" {
  tags = {
   name = "devops"
}
}

output "subnet-data" {
   value = data.aws_subnets.example.ids
}
data "aws_subnet" "example-1" {
  for_each = toset(data.aws_subnets.example.ids)
  id       = each.value
}

output "subnet-datai-1" {
   value = "${data.aws_subnet.example-1}"
#   value = element(split(",", data.aws_subnet.example-1), 0)
}
