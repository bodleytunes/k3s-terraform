#resource "aws_vpc" "prod" {
#    cidr_block = var.vpc_cidr
#    tags = merge(
#    local.common-tags,
#    map(
#      "Name", "prod",
#      "Description", "Prod VPC",
#    )
#  )
#}


#resource "aws_subnet" "prod_subnet" {
#  for_each        = var.subnets
#  cidr_block      = each.value.cidr
#  availability_zone = lookup(each.value, "az", null)
#  vpc_id          = aws_vpc.prod.id
#}#

#resource "aws_subnet" "prod_subnet" {
#  for_each        = var.subnet_ids
#  vpc_id          = aws_vpc.prod.id
#  cidr_block      = cidrsubnet(var.vpc_cidr, 1, each.value)
#  availability_zone = lookup(each.key, "az", null)

#}