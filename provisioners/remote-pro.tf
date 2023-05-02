/*resource "aws_key_pair" "kp" {
  key_name   = "myKey"       # Create a "myKey" to AWS!!
  public_key = file("~/.ssh/id_rsa.pub")
} */

resource "aws_instance" "test-remote-ec2" {
  ami           = "ami-0747e613a2a1ff483"
  instance_type = "t2.micro"
  key_name      = "devops13-eks-key"

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
    #   command = "echo 'instance id: \ ${aws_instance.test-ec2.id} ' >> instanceid.txt"

  }


  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("/home/ec2-user/devops13-eks-key.pem")
      host        = self.public_ip
    }
    inline = [
      "echo 'devops14'",
      "sudo yum install -y nginx"

    ]

  }
  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("/home/ec2-user/devops13-eks-key.pem")
      host        = self.public_ip
    }
    source      = "/home/ec2-user/tf/provisioners/user.html"
    destination = "/usr/share/nginx/html/"
  }

}


