# providers.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" #change me if you want
}

# Optional: Enable AWS S3 backend for state storage
terraform {
  backend "s3" {
    bucket  = "backend-696969" #create this manually 
    key     = "return0_lab.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

