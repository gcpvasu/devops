terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "myvpc" {
    source = "./modules/myvpc"
    ntier_cidr = "10.1.0.0/16"
    ntier_subnet_tags = ["ntier-web1", "ntier-app1" , "ntier-db1", "ntier-web2", "ntier-app2", "ntier-db2"]
    ntier_subnet_azs = ["us-east-1a" , "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
    web_subnet_indexes = [ 0,3 ]
    other_subnet_indexes = [ 1,2,4,5 ] 


}

output "vpcid" {
  value = "${module.myvpc.vpcid}"
  
}