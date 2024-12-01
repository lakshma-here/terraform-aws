variable "cidr" {
    description = "cidr range for vpc"
    type = string
}

variable "tenancy" {
    description = "A tenancy option for ec2 instances launched into the VPC"
    type = string
}

variable "subnets" {
    description = "subnets for vpc"
    type = map(any)
  
}

variable "rt_tags" {
    description = "tags for public route table"
    type = map(any)
  
}

variable "rt_cidr" {
    description = "subnet cidr for routetable association"
    type = string
    default = "0.0.0.0/0"
}

variable "subnet_id" {
    description = "subnet id"
    type = map(string)
}

variable "tags" {
    description = "nat tags"
    type = map(any)  
}
