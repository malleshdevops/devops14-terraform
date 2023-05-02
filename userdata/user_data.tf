data "template_file" "myuserdata" {
  template = file("templates/install.tpl")

}
resource "aws_instance" "test-instance" {
  ami           = "ami-009c5f630e96948cb"
  instance_type = "t2.micro"
  key_name      = "devops13-eks-key"
  /*user_data = <<EOF
                 #!/bin/bash
                 yum install -y httpd
                 mkdir /tmp/testing
	       EOF*/
  user_data = file("install-httpd.sh")
  tags = merge(
   local.tags,
   {
      purpose = "terraform"
   })

}
