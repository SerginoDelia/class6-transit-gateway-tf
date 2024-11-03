resource "aws_vpc" "tg-vpcs" {
  for_each   = var.transit-gateway
  cidr_block = each.value.cidr
  tags = {
    Name = each.key
  }
}

