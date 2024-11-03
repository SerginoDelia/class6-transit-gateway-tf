resource "aws_subnet" "tg-subnets" {
  for_each                = var.subnets
  vpc_id                  = aws_vpc.tg-vpcs[each.value.vpc].id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = {
    Name = each.key
  }
}
