###
# Providers
##

 
terraform {

    backend "local" {
        path = "~/.terraform.d/backend/k3s/terraform-prod.tfstate"
    }

}
 

 
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

module "ec2_master" {
    source = "./modules/ec2"
    #infra_env = var.prod_env
    infra_env = "prod"
    #prod_env = "prod"
    infra_role = "master"
    instance_size = "t2.medium"
    instance_ami = data.aws_ami.app.id
}

