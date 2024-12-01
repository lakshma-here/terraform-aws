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
