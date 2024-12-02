# vpc.tf

resource "aws_vpc" "Return0_lab_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Return0"
  }
}

# Create subnets for each network segment

# Management Subnet
resource "aws_subnet" "management_subnet" {
  vpc_id                  = aws_vpc.Return0_lab_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "ManagementSubnet"
  }
}

# Support Subnet
resource "aws_subnet" "support_subnet" {
  vpc_id                  = aws_vpc.Return0_lab_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "SupportSubnet"
  }
}

# Static Analysis Subnet
resource "aws_subnet" "static_analysis_subnet" {
  vpc_id                  = aws_vpc.Return0_lab_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "StaticAnalysisSubnet"
  }
}

# Dynamic Analysis Subnet
resource "aws_subnet" "dynamic_analysis_subnet" {
  vpc_id                  = aws_vpc.Return0_lab_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "DynamicAnalysisSubnet"
  }
}
