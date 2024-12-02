# variables.tf

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones to use"
  type        = list(string)
  default     = ["us-east-1a"]
}

variable "login_key" {
  default = "sshaccessor"
}

variable "instance_ami" {
  description = "AMI IDs for instances"
  type        = map(string)
  default = {
    # Provide the appropriate AMI IDs for each instance type
    "awsami2_arm64"      = "ami-07bc5cc4add81dad9" # Amazon Linux 2 AMI ARM_64
    "windows_x86_64"     = "ami-05b1a50d6798f63cb" # Microsoft Windows Server 2025 Base x86_64
    "ubuntu_2404_x86_64" = "ami-0866a3c8686eaeeba" # Ubuntu Server 24.04 x86_64
    "ubuntu_2404_arm64"  = "ami-0325498274077fac5" # Ubuntu Server 24.04 ARM_64
  }
}
