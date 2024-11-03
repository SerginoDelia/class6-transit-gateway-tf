locals {
  vpc    = "vpc-a-virginia-prod"
  subnet = "subnet-a-virginia-prod-public"
  name   = "nat"
}


resource "aws_eip" "nat-a-virginia-prod" {
  vpc = true

  tags = {
    Name = local.vpc
  }
}

resource "aws_nat_gateway" "nat-gw-a-virginia-prod" {
  allocation_id = aws_eip.nat-a-virginia-prod.id
  subnet_id     = aws_subnet.tg-subnets[local.subnet].id

  tags = {
    Name = local.name
  }

  depends_on = [aws_internet_gateway.igw-a-virginia-prod]
}
