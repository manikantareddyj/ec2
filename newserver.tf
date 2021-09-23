provider "aws" {
 region = "ap-south-1"
}

    resource "aws_instance" "ec" {
        ami = "ami-06a0b4e3b7eb7a300"
        instance_type = "t2.micro"
 security_groups = [aws_security_group.sa.name]
        key_name = "sample"
           tags = {
           Name = "demo"
                  }
     }


resource "aws_default_vpc" "main" {
 

  tags = {
    Name = "main"
  }
}


resource "aws_security_group" "sa" {
  name        = "sa"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_default_vpc.main.id

  ingress = [

    {
      description      = "ssh-port"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [aws_default_vpc.main.cidr_block]
      ipv6_cidr_blocks = []
 prefix_list_ids =[]
 self   = false
 security_groups =[]
    }
  ]

 

  tags = {
    Name = "sa"
  }
}
