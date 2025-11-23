terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# -----------------------------
#  S3 Bucket
# -----------------------------
resource "aws_s3_bucket" "this" {
  bucket = var.s3_bucket_name
}

# -----------------------------
#  ECR Repository
# -----------------------------
resource "aws_ecr_repository" "this" {
  name                 = var.ecr_repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

# -----------------------------
#  EC2 Instance
# -----------------------------
resource "aws_instance" "this" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type

  tags = {
    Name = var.ec2_name
  }
}
