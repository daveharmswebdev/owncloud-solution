resource "aws_instance" "owncloud-server" {
  ami                         = var.ubuntu_ami
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  key_name                    = var.key_pair

  vpc_security_group_ids = [aws_security_group.public_sg.id]

  tags = merge(
    local.common_tags,
    {
      Name = "owncloud-server"
    }
  )
}

resource "aws_instance" "mysql-server" {
  ami           = var.private_server_ami
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
  key_name      = var.key_pair

  vpc_security_group_ids = [aws_security_group.private_sg.id]

  tags = merge(
    local.common_tags,
    {
      Name = "mysql-server"
    }
  )
}