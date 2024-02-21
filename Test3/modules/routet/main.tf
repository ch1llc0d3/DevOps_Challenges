resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count          = var.subnet_count
  subnet_id      = var.public_subnets[count.index]
  route_table_id = aws_route_table.public_route_table.id
}


