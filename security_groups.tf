resource "aws_security_group" "public_sg" {
  vpc_id = aws_vpc.owncloud-vpc.id

  description = "Opens port for SSH and HTTP"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "public-server-SG"
    }
  )
}

resource "aws_security_group" "private_sg" {
  vpc_id = aws_vpc.owncloud-vpc.id

  # mysql
  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
  }

  # bastion setup
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${aws_instance.owncloud-server.private_ip}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}