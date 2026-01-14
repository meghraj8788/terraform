terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "meghraj-terraform-state-eu-west-1"
    key = "terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "store-state-file-id"
  }
}