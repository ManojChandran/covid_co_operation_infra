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

#----create cognito user pool------------
module "aws-cognito" {
  source = "./modules/cognito"
}

##----create api gateway------------
#module "aws-api-gateway" {
#  source = "./modules/apigateway"
#}

#----create dynamodb table------------
module "aws-dynamodb" {
  source = "./modules/dynamodb"
}
