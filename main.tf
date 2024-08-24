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
  access_key = "AKIARDUKXSSFAHYXYJOD"
  secret_key = "AiOJDmYyGnZFhjUJnd2Mwz6UxmEI6JgcmMnzO5tb"
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
