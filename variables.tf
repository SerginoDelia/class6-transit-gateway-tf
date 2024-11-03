variable "transit-gateway" {
  type        = map(map(string))
  description = "A map of maps of string for the Transit Gateway"

  default = {
    vpc-a-virginia-prod = {
      cidr = "10.40.0.0/16"
      Name = "vpc-a-virginia-prod"
    }

    vpc-d-virginia-dev = {
      cidr = "10.41.0.0/16"

    }

    vpc-f-virginia-test = {
      cidr = "10.42.0.0/16"
    }
  }

}

variable "subnets" {
  type        = map(map(string))
  description = "A map of maps of string for the Subnets"
  default = {
    subnet-a-virginia-prod-public = {
      vpc  = "vpc-a-virginia-prod"
      cidr = "10.40.1.0/24"
      az   = "us-east-1a"
    }

    subnet-a-virginia-prod-private = {
      vpc  = "vpc-a-virginia-prod"
      cidr = "10.40.11.0/24"
      az   = "us-east-1a"
    }

    subnet-d-virginia-dev-private = {
      vpc  = "vpc-d-virginia-dev"
      cidr = "10.41.14.0/24"
      az   = "us-east-1a"
    }

    subnet-f-virginia-test-private = {
      vpc  = "vpc-f-virginia-test"
      cidr = "10.42.16.0/24"
      az   = "us-east-1a"
    }

  }
}

variable "rt-private-association" {
  type        = map(map(string))
  description = "A map of maps of string for the Route Tables"
  default = {
    private = {
      vpc = "vpc-a-virginia-prod"
    }
  }
}
