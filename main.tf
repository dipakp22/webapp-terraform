terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.64.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

resource "aws_instance" "web" {
  ami           = "ami-0e86e20dae9224db8"  # Ubuntu AMI ID (Change to your region's Ubuntu AMI ID)
  instance_type = "t2.micro"

  tags = {
    Name = "WebServer"
  }
}

output "instance_ip" {
  value = aws_instance.web.public_ip
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

provisioner "file" {
  source      = "C:\Users\dell\Desktop/index.html"
  destination = "/var/www/html/index.html"
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("~/.ssh/authorized_keys")
  }
}
