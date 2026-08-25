provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "one" {
  count = 4

  ami           = "ami-0e5497a77ef21b5ac"
  instance_type = "c7i-flex.large"
  key_name      = "yashu"

  vpc_security_group_ids = ["sg-09459fa40ed5ac045"]

  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = [
    "jenkins",
    "APPSERVER-1",
    "APPSERVER-2",
    "Monitoring server"
  ]
}
