terraform {
#   backend "s3" {
#    bucket         = "terraform"
#    key            = "prueba-1/terraform.tfstate"
#    region         = "us-east-1"
#    encrypt        = true
#    kms_key_id     = "alias/terraform-key"
#    dynamodb_table = "terraform-state"
#   #  profile = "ecs-dev"
#  }

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
# provider "aws" {
#   # profile = "ecs-dev"
#   region  = var.aws_region
# }