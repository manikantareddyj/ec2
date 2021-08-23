provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}

resource "aws_instance" "aws-server-1" {
  ami           = "ami-0c1a7f89451184c8b"
  instance_type = "t2.micro"
}
