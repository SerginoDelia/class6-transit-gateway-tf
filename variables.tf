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
      Name = "vpc-d-virginia-dev"

    }

    vpc-f-virginia-test = {
      cidr = "10.42.0.0/16"
      Name = "vpc-f-virginia-test"
    }
  }

}

variable "subnets" {
  type        = map(map(string))
  description = "A map of maps of string for the Subnets"
  default = {
    subnet-a-virginia-prod-public = {
      cidr = "10.40.1.0/24"
      az   = "us-east-1a"
      Name = "subnet-a-virginia-prod-public"
    }
  }
}
