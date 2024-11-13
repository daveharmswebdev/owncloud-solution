provider "aws" {
  region = var.aws_region
}

locals {
  common_tags = {
    Terraform = "true"
    Owncloud  = "true"
  }
}

resource "aws_vpc" "owncloud-vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = merge(
    local.common_tags,
    {
      Name = var.vpc_name
    }
  )
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.owncloud-vpc.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {
      Name = "public_subnet"
    }
  )
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.owncloud-vpc.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = "us-east-1b"

  tags = merge(
    local.common_tags,
    {
      Name = "private_subnet"
    }
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.owncloud-vpc.id

  tags = merge(
    local.common_tags,
    {
      Name = "igw"
    }
  )
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.owncloud-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(
    local.common_tags,
    {
      Name = "public_crt"
    }
  )
}

resource "aws_route_table_association" "public_rt_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}