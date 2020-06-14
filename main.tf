#-------------root/main.tf------------

provider "aws" {
  region = var.aws-region
}

#----create dynamodb table------------
module "dynamodb" {
  source = "./dynamodb"
}
