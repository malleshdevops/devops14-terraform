resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFVvDrq2vRF36gJIWoLFAxEjKC2Ikd0CCBmuwnikOon1VyjgH954eTB9+pCW4j0P9xPzDimM9/hC3N1bsoLToq6Iz+hqINcBZLqV7RfrTbww6LarfwH8MYXPZenbN83Aydz6LYjbCGk+XazCTWQ7f8S2yOrAtLLgxgw8aD6lQCK4DWtVGepSunPWPjxrzo+vwJvCqtdWXBA3XFU8kZDnIlyukj6YS6K4SFEMuVstXpL/kKobzKdisp4IHqsviqys5HjVsO/UvEOItKF81CQQSvVIOxFY7BPMgIlTF5YhjUtTZw1x+Fs4vhtr+oOZNmiQVvp8dsk4rwdxSpG2vsZY5x8JFiP0P58gCwQrMzmhHhbuAPxfUNbr8H3HfNLzm8SFMOLCysMDvAI+7XQpUwLEm/wgj/QbSIIohn1leF5mgfPyj8FlLrGBC5nbxtFopGuy5rOy3M2fWOTWgxljW9+KqUliOZlsJgB2a4Opxp5GthC4Hbhvf86ZGPEYuzmKspK9s= ec2-user@ip-172-31-7-70.us-west-2.compute.internal"
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "myKey"       # Create a "myKey" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh
}
