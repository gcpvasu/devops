terraform {
    required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "~> 3.0"
      }
    }
}

#provider for aws
provider "aws"{
    region = "us-east-1"  
    access_key = "AKIATQOLYSZULCEQY3U5"
    secret_key = "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"  
}

#Resource for aws

resource "aws_s3_bucket" "my_bucket" { 
    bucket = "tfpractice222"    
}