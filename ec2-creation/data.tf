data "aws_instances" "example" {
  instance_state_names = ["running", "stopped"]
}

output "instace-details" {
   value = data.aws_instances.example[*].ids
}


