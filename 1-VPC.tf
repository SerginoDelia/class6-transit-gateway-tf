# Make another folder and then replicate the 3 VPCs from the Transit Gateway lessons last week.
# resource "aws_vpc" "vpc-a-virginia-prod" {
#   cidr_block = "10.40.0.0/16"
#   tags = {
#     Name = "vpc-a-virginia-prod"
#   }
# }

# resource "aws_vpc" "vpc-d-virginia-dev" {
#   cidr_block = "10.41.0.0/16"
#   tags = {
#     Name = "vpc-d-virginia-dev"
#   }
# }

# resource "aws_vpc" "vpc-f-virginia-test" {
#   cidr_block = "10.42.0.0/16"
#   tags = {
#     Name = "vpc-f-virginia-test"
#   }
# }

resource "aws_vpc" "tg-vpcs" {
  for_each   = var.transit-gateway
  cidr_block = each.value.cidr
  tags = {
    Name = each.value.Name
  }
}

