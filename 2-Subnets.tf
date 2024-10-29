#These are   for  public

resource "aws_subnet" "subnet-a-virginia-prod-public" {
  vpc_id                  = aws_vpc.vpc-a-virginia-prod.id
  cidr_block              = "10.40.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-a-virginia-prod-public"
  }
}

resource "aws_subnet" "subnet-a-virginia-prod-private" {
  vpc_id                  = aws_vpc.vpc-a-virginia-prod.id
  cidr_block              = "10.40.11.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-a-virginia-prod-private"
  }
}

resource "aws_subnet" "subnet-d-virginia-dev-private" {
  vpc_id                  = aws_vpc.vpc-d-virginia-dev.id
  cidr_block              = "10.41.14.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-a-virginia-dev-private"
  }
}

resource "aws_subnet" "subnet-f-virginia-test-private" {
  vpc_id                  = aws_vpc.vpc-f-virginia-test.id
  cidr_block              = "10.42.16.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-a-virginia-prod-private"
  }
}


