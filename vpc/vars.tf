variable "cidr" {
    description = "cidr range for vpc"
    type = string
}

variable "tenancy" {
    description = "A tenancy option for ec2 instances launched into the VPC"
    type = string
}

variable "dns_support" {
    description = "a boolean flag to support DNS in vpc"
    type = bool
    default = true
}

variable "dns_hostnames" {
    description = "A boolean flag to enable DNS hostnames in the VPC."
    type = bool
    default = true
}

variable "tags" {
    description = "name of vpc"
    type = map(any)
    default = {
        Name = "my-first-vpc"
    }
}
