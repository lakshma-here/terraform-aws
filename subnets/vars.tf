variable "vpc_subnets" {
    description = "blueprint configuration for your vpc subnets"
    type = map(object({
        az = string
        cidr = string
        enable_public_ip = bool
        tags = map(any)
    }))
  
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
