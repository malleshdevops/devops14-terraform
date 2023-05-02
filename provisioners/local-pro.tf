/*resource "aws_instance" "test-ec2" {
  ami           = "ami-0747e613a2a1ff483"
  instance_type = "t2.micro"
  key_name      = "devops13-eks-key"

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
    #   command = "echo 'instance id: \ ${aws_instance.test-ec2.id} ' >> instanceid.txt"

  }

} */
