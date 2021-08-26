# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.6.0"
 
  # insert the 49 required variables here
  name = "wizznet-${var.infra_env}-vpc"
  cidr = var.vpc_cidr
 
  azs = var.azs
 
  # Single NAT Gateway, see docs linked above
  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false
 
  public_subnets = var.master_subnets
  private_subnets  = var.worker_subnets
  #internet_subnet = var.internet_subnet
 
  tags = {
    Name = "wizznet-${var.infra_env}-vpc"
    Project = "k3s-project"
    Environment = var.infra_env
    ManagedBy = "terraform"
    }
  }