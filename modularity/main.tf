resource "aws_instance" "devops14-ec2-server" {
  ami           = "ami-0747e613a2a1ff483"
  instance_type = var.ec2-type
  key_name      = var.cred
  for_each      = toset(var.subnetid)
  subnet_id     = each.key
  tags          = local.tags
  lifecycle {
  }
}
