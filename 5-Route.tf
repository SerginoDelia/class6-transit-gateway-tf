locals {
  private-azs = {
    a = "us-east-1a"
    b = "us-east-1b"
    c = "us-east-1c"
  }

  public-azs = {
    a = "us-east-1a"
    b = "us-east-1b"
    c = "us-east-1c"
  }

  # iterate over the local.private-azs create a map of the private AZs
  private = {
    for az, name in local.private-azs : az => {
      az   = az
      name = name
    }
  }
  # iterate over the local.public-azs create a map of the public AZs
  public = {
    for key, value in local.public-azs : key => {
      key   = key
      value = value
    }
  }
}

resource "aws_route_table" "rt" {
  for_each = var.route-tables
  vpc_id   = aws_vpc.tg-vpcs["${each.value.vpc}"].id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = each.key == "private" ? aws_nat_gateway.nat-gw-a-virginia-prod.id : ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = each.key == "public" ? aws_internet_gateway.igw-a-virginia-prod.id : ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = each.key
  }
}

# create 2 route table associations one private and one public
resource "aws_route_table_association" "us-east-1" {
  for_each       = var.route-tables
  subnet_id      = aws_subnet.tg-subnets["${each.value.subnet}"].id
  route_table_id = aws_route_table.rt["${each.key}"].id
}
