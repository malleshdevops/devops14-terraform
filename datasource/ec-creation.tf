resource "aws_instance" "myinstance" {
  ami = "ami-0747e613a2a1ff483"
  instance_type = "t2.micro"
  subnet_id = data.aws_subnets.example.ids[0]

}
