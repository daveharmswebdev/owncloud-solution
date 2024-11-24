output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.owncloud-vpc.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.private_subnet.id
}

output "public_subnet_cidr_block" {
  description = "The CIDR block of the public subnet"
  value       = aws_subnet.public_subnet.cidr_block
}

output "private_subnet_cidr_block" {
  description = "The CIDR block of the private subnet"
  value       = aws_subnet.private_subnet.cidr_block
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public_route_table.id
}

output "public_server_sg_id" {
  description = "The ID of the public server security group"
  value       = aws_security_group.public_sg.id
}

output "public_server_ec2" {
  description = "The ID of the public EC2 instance"
  value       = aws_instance.owncloud-server.id
}

output "private_server_sg_id" {
  description = "The ID of the private server security group"
  value       = aws_security_group.private_sg.id
}

output "private_server_ec2" {
  description = "The ID of the private EC2 instance"
  value       = aws_instance.mysql-server.id
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.nat_gateway.id
}

output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.private_route_table.id
}

output "owncloud_ssh_string" {
  description = "The SSH Connection"
  value = "ssh -i ${var.key_pair}.pem ubuntu@${aws_instance.owncloud-server.public_ip}"
}

output "mysql_server_ssh_string" {
  description = "The SSH Connection"
  value = "ssh -i ${var.key_pair}.pem ubuntu@${aws_instance.mysql-server.private_ip}"
}

output "scp_command_to_owncloud_server" {
  description = "SCP command to copy key pair to owncloud server"
  value = "scp -i ${var.key_pair}.pem ./${var.key_pair}.pem ubuntu@${aws_instance.owncloud-server.public_ip}:/home/ubuntu/${var.key_pair}.pem"
}


