variable "ntier_cidr" {
    type = string
    default = "10.10.0.0/16"
}

variable "ntier_region" {
    type = string
    default = "us-east-1"
  
}

variable "ntier_subnet_cidrs" {
    type = list(string)
    default = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]
}

variable "ntier_subnet_azs" {
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
  
}