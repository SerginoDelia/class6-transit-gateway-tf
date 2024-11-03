resource "aws_internet_gateway" "igw-a-virginia-prod" {
  vpc_id = aws_vpc.tg-vpcs["vpc-a-virginia-prod"].id

  tags = {
    Name = "vpc-a-virginia-prod"
  }
}
