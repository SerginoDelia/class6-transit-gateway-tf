resource "aws_eip" "nat-a-virginia-prod" {
  vpc = true

  tags = {
    Name = "nat-a-virginia-prod"
  }
}

resource "aws_nat_gateway" "nat-gw-a-virginia-prod" {
  allocation_id = aws_eip.nat-a-virginia-prod.id
  subnet_id     = aws_subnet.subnet-a-virginia-prod-public.id

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw-a-virginia-prod]
}
