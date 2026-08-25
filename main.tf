provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "one" {
  count = 4

  ami           = "ami-0e5497a77ef21b5ac"
  instance_type = "c7i-flex.large"
  key_name      = "server-1"

  vpc_security_group_ids = ["sg-0e5fc0d70bedf6283"]

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
