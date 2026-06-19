terraform {
  required_version = ">= 1.0" # Pon la versión que uses

  backend "s3" {
    bucket         = "knoppix50-19062026-terraform-state" # El nombre que creaste
    key            = "terraform/state.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}


# Specify the provider and access details

provider "aws" {
  
}

# Create an S3 bucket
resource "aws_s3_bucket" "udabucket" {
  bucket = "cicd-terraform-demo-knoppix50-bucket20213"

  tags = {
    Name        = "CICD test bucket"
    Environment = "Dev"
  }
}

# Create an EC2 instance
resource "aws_instance" "ec2_instance" {
  ami           = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"

  tags = {
    Name = "CICD test instance"
  }
}
