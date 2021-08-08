terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0" 
        }
    }
}

provider "aws" {
    region = "us-east-1"  
}

resource "aws_vpc" "testvpc" {
    cidr_block = "10.10.0.0/16"  
    tags = {
      "Name" = "ntier"
    }
  
}

resource "aws_subnet" "websubnet" {
    cidr_block = "10.10.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
      "Name" = "ntier-web"
    }
    vpc_id = "${aws_vpc.testvpc.id}"      
  
}