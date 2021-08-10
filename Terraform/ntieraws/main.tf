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


resource "aws_security_group" "websg" {
    name = "openhttp"
    description = "openhttp and ssh"
    vpc_id = "${aws_vpc.testvpc.id}"
    tags = {
      "Name" = "websg"
    }
}

resource "aws_security_group_rule" "websgopenhttp" {
    type = "ingress"
    from_port = "80"    
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.websg.id}"
}

resource "aws_security_group_rule" "websgopenssh" {
    type = "ingress"
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.websg.id}"
}
resource "aws_key_pair" "ntier" {
    key_name = "ntier"     
    public_key = "${file("~/Downloads/ntier.pem")}"           
}
resource "aws_instance" "webserver1" {
    ami = "ami-09e67e426f25ce0d7"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.subnets[0].id}"
    associate_public_ip_address = true
    key_name = "ntier"
    security_groups = ["${aws_security_group.websg.id}"]
    tags = {
      "Name" = "webserver1"
    }   
}





  

  
