resource "aws_subnet" "subnets" {
    for_each = var.vpc_subnets
    vpc_id = data.aws_vpc.selected.id # terraform understands the execution flow we explicitly doesn't have to write code in order
    availability_zone = each.value.az
    cidr_block = each.value.cidr
    map_public_ip_on_launch = each.value.enable_public_ip
    tags = each.value.tags
}

# Reference same tag and values used for VPC creation with proper caemlcasing
data "aws_vpc" "selected" {
    filter {
        name = "tag:Name"
        values = ["my-first-vpc"]
    }

    filter {
       name = "tag:Env"
       values = ["DEV"]
    }
}

resource "aws_route_table_association" "route_table_association" {
    for_each = toset(local.public_subnet_ids)
    subnet_id = each.value
    route_table_id = aws_route_table.route_table.id
}

locals {
  public_subnet_ids = [
    for subnet in aws_subnet.subnets : subnet.id
    if subnet.tags["Name"] == "public-subnet"
  ]
}




resource "aws_internet_gateway" "igw" {
    vpc_id = data.aws_vpc.selected.id
    tags = {
      Name = "Dev-igw"
    }
}


resource "aws_route_table" "route_table" {
    vpc_id = data.aws_vpc.selected.id
    tags = var.rt_tags
    route {
        cidr_block = var.rt_cidr
        gateway_id = aws_internet_gateway.igw.id
    }
  
}



# data "aws_route_table" "public_rt" {
#   filter {
#     name   = "tag:Name"
#     values = ["public-rt"]
#   }
# }
