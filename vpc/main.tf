resource "aws_vpc" "vpc" {
    cidr_block = var.cidr
    instance_tenancy = var.tenancy
    enable_dns_support = var.dns_support
    enable_dns_hostnames = var.dns_hostnames
    tags = merge(
        var.tags,
        { Env = "DEV" }
    )
}
