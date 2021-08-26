###
# Providers
##

 

 

 
locals {
    cidr_subnets = cidrsubnets("10.100.0.0/16", 1, 1, 1, 1, 1)
}
 
###
# Resources
##
module "vpc" {
  source = "./modules/vpc"
 
  infra_env = var.infra_env
  vpc_cidr = "10.100.0.0/16"
  azs = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
  master_subnets = slice(local.cidr_subnets, 0, 2)
  worker_subnets = slice(local.cidr_subnets, 2, 4)
  internet_subnet = local.cidr_subnets[5]
}


data "aws_ami" "app" {
    most_recent = true
    owners = ["canonical"]

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20*"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
    filter {
        name = "architecture"
        values = ["x86_64"]
    }
}