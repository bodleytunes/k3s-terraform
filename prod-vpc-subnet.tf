 
locals {
    cidr_subnets = cidrsubnets("10.100.0.0/16", 8, 8, 8, 8, 8)
}
 
###
# Resources
##

resource "aws_vpc" "prod" {
  provider = aws
  cidr_block = var.vpc_cidr
  tags = {
    Name = "vpc-prod"
   }
}


resource "aws_subnet" "master_subnets" {
  for_each          = var.master_subnets
  cidr_block        = each.value.cidr
  availability_zone = lookup(each.value, "az", null)
  vpc_id            = aws_vpc.prod.id
}

resource "aws_subnet" "worker_subnets" {
  for_each          = var.worker_subnets
  cidr_block        = each.value.cidr
  availability_zone = lookup(each.value, "az", null)
  vpc_id            = aws_vpc.prod.id
}