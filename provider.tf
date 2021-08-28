terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.56.0"
    }
  }

}

#provider "aws" {
#  shared_credentials_file = "~/.aws/credentials"
#  profile = "wizznet"
#  region  = var.aws_region
#}


provider "aws" {
#  shared_credentials_file = "~/.aws/credentials"
  region  = "eu-west-3"
  access_key = var.aws_access_key
 	secret_key = var.aws_secret_key

}

