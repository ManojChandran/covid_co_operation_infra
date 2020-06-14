#-------------root/main.tf------------

# To prevent automatic upgrades to new major versions 
# that may contain breaking changes
terraform {
  required_providers {
    aws = "~> 2.66"
  }
}

provider "aws" {
  region = var.aws-region
}

#----create dynamodb table------------
module "dynamodb" {
  source = "./dynamodb"
}
