variable "aws_region" {
  description = "AWS region."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of VPC."
  type        = string
  default     = "owncloud-vpc"
}

variable "public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "The CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "ssh_allowed_ip" {
  description = "Allowed ip address for SSH access"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ubuntu_ami" {
  description = "AMIs for Ubuntu 22.04 instances"
  type        = string
  default     = "ami-005fc0f236362e99f"
}

variable "key_pair" {
  description = "Key pair for the EC2 instance"
  type        = string
  default     = "own-cloud"
}
