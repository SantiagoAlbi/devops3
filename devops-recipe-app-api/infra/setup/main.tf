terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }
  backend "s3" {
    bucket         = "devops-recetas-app-tf-state-italiano"
    key            = "tf-state-setup"
    encrypt        = true
    dynamodb_table = "devops-recipi-app-tf-lock-ita"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Enviroment = terraform.workspace
      Project    = var.project
      contact    = var.contact
      ManagedBy  = "Terraform/setup"

    }
  }
}
