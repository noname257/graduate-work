provider "aws" {
  region = "eu-north-1"
  access_key = "YOUR KEY"
  secret_key = "YOUR KEY"
  
}

resource "aws_instance" "ubuntu_Intstance" {
  count = 1
  ami = "ami-0ff338189efb7ed37"
  instance_type = "t3.micro"
  key_name = "telebot"
  vpc_security_group_ids = [aws_security_group.ubuntuWeb.id]
 provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ip.txt"
  }
tags = {
  Name = "TELEBOT"
 }
}

resource "aws_security_group" "ubuntuWeb" {
  name = "ubuntuWeb"
  description = "Allow 22 , 80 , 8080"
  ingress {
    description = "allow 22 port"
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow 19999 port"
    from_port = 19999
    protocol = "tcp"
    to_port = 19999
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow 80 port"
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
    }
  ingress {
    description = "allow 8080 port"
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
    cidr_blocks = ["0.0.0.0/0"]
      }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
#resource "aws_instance" "test" {
 #ami = "ami-0ff338189efb7ed37"
  #provisioner "local-exec" {
   # command = "echo ${self.private_ip} >> private_ips.txt"
  #}
#}