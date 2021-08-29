resource "aws_internet_gateway" "prod" {
  vpc_id = aws_vpc.prod.id
}

resource "aws_eip" "prod_master_eip" {
  for_each = aws_instance.masters
  instance = each.value.id
  vpc      = true
  depends_on = [aws_internet_gateway.prod]

}

# create a new map of instances to eips
#locals {
#    eip_output = zipmap( values(aws_instance.masters)[*].id, values(aws_eip.prod_master_eip)[*].id ) 
#}


#resource "aws_eip_association" "eip_assoc" {
#  for_each = local.eip_output
#  instance_id   = each.key
#  allocation_id = each.value
#}
