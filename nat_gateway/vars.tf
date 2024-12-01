variable "subnet_id" {
    description = "subnet id"
    type = string
    default = "sb-1000"
}

variable "tags" {
    description = "tag"
    type = map(any)
    default = {
      Name = "public-nat"
    }
}