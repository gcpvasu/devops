resource "aws_vpc" "testvpc" {
    cidr_block = var.ntier_cidr  
    tags = {
      "Name" = "ntier"
    }
  
}

resource "aws_subnet" "subnets" {
    count = length(var.ntier_subnet_azs)
    cidr_block = cidrsubnet(var.ntier_cidr, 8, count.index)
    availability_zone = var.ntier_subnet_azs[count.index]
    tags = {
      "Name" = var.ntier_subnet_tags[count.index]
    }
    vpc_id = "${aws_vpc.testvpc.id}"
  
}

resource "aws_internet_gateway" "ntier_igw"{
    vpc_id = "${aws_vpc.testvpc.id}"

    tags = {
      "Name" = "ntier_igw"
    }
  
}

