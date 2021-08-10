variable "ntier_cidr" {
    type = string
    default = "10.10.0.0/16"
}

variable "ntier_region" {
    type = string
    default = "us-east-1"
  
}



variable "ntier_subnet_azs" {
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]  
}

variable "ntier_subnet_tags" {
    default = ["ntier-web1", "ntier_app1", "ntier-db1"]  
}


variable "web_subnet_indexes" {
    type = list(string)
    default = [ 0 ]
  
}