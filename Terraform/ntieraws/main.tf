resource "aws_vpc" "testvpc" {
    cidr_block = var.ntier_cidr  
    tags = {
      "Name" = "ntier"
    }
  
}

resource "aws_subnet" "subnets" {
    count = 3
    cidr_block = var.ntier_subnet_cidrs[count.index]
    availability_zone = var.ntier_subnet_azs[count.index]
    tags = {
      "Name" = var.ntier_subnet_tags[count.index]
    }
    vpc_id = "${aws_vpc.testvpc.id}"
  
}

