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

resource "aws_route_table" "public_rt" {
    vpc_id = "${aws_vpc.testvpc.id}"
    
    route = [ ]
    tags = {
      "Name" = "ntier_public_rt"
    }
}

resource "aws_route" "publicrt" {
  route_table_id = "${aws_route_table.public_rt.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.ntier_igw.id}"
}

resource "aws_route_table_association" "public_rt_association" {
    count = length(var.web_subnet_indexes)
    subnet_id = "${aws_subnet.subnets[var.web_subnet_indexes[count.index]].id}"
    route_table_id = "${aws_route_table.public_rt.id}"
}