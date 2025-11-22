provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example_instance" {
  ami           = "ami-02b8269d5e85954ef" 
  instance_type = "t3.micro" 
  subnet_id = "subnet-0337081fbe4ae5ee6" 
  vpc_security_group_ids = ["sg-0d0e4740d9e17386d"]
  
  tags = {
    Name = "EC2Instance_2"
  }
}
