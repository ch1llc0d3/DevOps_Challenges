terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.47.0"
    }
    local = {
      source = "hashicorp/local"
      version = "~> 2.4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  # profile = "ecs-dev"
  region  = "us-east-1"
}