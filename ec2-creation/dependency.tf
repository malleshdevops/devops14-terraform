resource "aws_instance" "test" {
   ami = "ami-0747e613a2a1ff483"
  instance_type = "t2.micro"
  key_name = "devops14-aws"
  tags = {
    batch = "14"
    test = "devops14"
    Name = "testing"
    project = "terraform"
  }
depends_on = [aws_vpc.my-vpc,aws_subnet.my_subnet]

}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = "192.0.0.0/28"
  availability_zone = "us-west-2a"
  depends_on = [aws_vpc.my-vpc-1]
  tags = {
    Name = "tf-example"
  }
}

resource "aws_vpc" "my-vpc" {
   cidr_block = "192.0.0.0/26"
}

