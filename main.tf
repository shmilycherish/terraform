provider "aws" {
  region = "ap-southeast-1"
}


resource "aws_instance" "server" {
  ami           = "ami-08569b978cc4dfa10"
  instance_type = "t2.nano"

  tags {
    Name = "cy-terraform"
  }
}
