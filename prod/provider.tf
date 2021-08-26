terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.55.0"
    }
  }

#  backend "s3" {
#    bucket = "terraform-state-wizznet"
#    key    = "wizznet/terraform-prod.tfstate"
#    profile = "wizznet"
#    region = "eu-west-1"
#    dynamodb_table = "wizznet-terraform-state"
#}
}

provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile = "wizznet"
  region  = var.aws-region
}

variable "prod_env" {
  type = string
  description = "production environment"
  default = "prod"
}

variable default_region {
  type = string
  default = "eu-west-3"
  description = "The default region"
}

