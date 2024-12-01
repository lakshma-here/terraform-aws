module "vpc" {
    source = "./vpc"
    cidr = var.cidr
    tenancy = var.tenancy

}

module "subnets" {
    source = "./subnets"
    vpc_subnets = var.subnets
    rt_tags = var.rt_tags
    rt_cidr = var.rt_cidr
}

module "nat_gateway" {
    source = "./nat_gateway"
    count = length(module.subnets)
    subnet_id = module.subnets.count.index
    tags = count.index
  
}

