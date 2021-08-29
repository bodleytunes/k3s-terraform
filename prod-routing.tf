resource "aws_route_table" "prod" {

  vpc_id = aws_vpc.prod.id
  

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod.id
  }

    tags = {
        Name = "prod"
  }

}

# set table to main
resource "aws_main_route_table_association" "main" {
  vpc_id         = aws_vpc.prod.id
  route_table_id = aws_route_table.prod.id
}