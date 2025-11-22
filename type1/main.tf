provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example_instance" {
  ami           = "ami-02b8269d5e85954ef" 
  instance_type = "t3.micro" 
  subnet_id     = "subnet-0337081fbe4ae5ee6" 
  vpc_security_group_ids = ["sg-0d0e4740d9e17386d"]
  
  tags = {
    Name = "EC2Instance_2"
  }
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "aravind-demo-bucket-12345"

  tags = {
    Name = "DemoS3Bucket"
  }
}

resource "aws_ecr_repository" "example_ecr" {
  name = "aravind-demo-ecr"

  image_tag_mutability = "MUTABLE"

  tags = {
    Name = "DemoECRRepository"
  }
}
