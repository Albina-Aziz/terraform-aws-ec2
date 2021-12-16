

resource "aws_instance" "ec2-demo" {
  ami                    = var.ami
  instance_type          = var.type
  tags = {    
    Name=var.instance_name

  }
}


























































