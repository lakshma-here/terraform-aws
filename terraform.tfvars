cidr = "10.0.0.0/16"
tenancy = "default"
subnets = {
  sub1 = {
    az = "us-east-1a"
    cidr = "10.0.0.0/24"
    enable_public_ip = true
    tags = {
        Name = "public-subnet"
    }
  },

  "sub2" = {
     az = "us-east-1b"
     cidr = "10.0.1.0/24"
     enable_public_ip = false
     tags = {
        Name = "private-subnet"
     }
  }
}

rt_tags = {
  "Name" = "public-rt"
}

rt_cidr = "0.0.0.0/0"

tags = {
  tag1 = {
    Name = "public-nat"
  }
}
