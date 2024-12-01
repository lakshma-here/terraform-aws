resource "aws_nat_gateway" "nat_gateway" {
    subnet_id = var.subnet_id
    allocation_id = aws_eip.nat_gateway_eip.id
    tags = var.tags
}


resource "aws_eip" "nat_gateway_eip" {
  domain = "vpc"  # Ensures the EIP is for use in a VPC
  tags = {
    Name = "nat-gateway-eip"
  }
}