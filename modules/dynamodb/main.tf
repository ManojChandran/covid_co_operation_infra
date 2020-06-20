#-------------dynamodb/main.tf------------
# TLDR;
# If you store your dates / timestamps as ISO 8601 format, you should use String.
# If you store your dates / timestamps in Epoch format, you should use Number.
#--------------------------------------------------------------------------------

resource "aws_dynamodb_table" "dynamodb-table" {
  name           = "trackerDB"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "useremailid"
  range_key      = "userscantimestmp"

  attribute {
    name = "useremailid"
    type = "S"
  }

  # Epoch format
  attribute {
    name = "userscantimestmp"
    type = "N"
  }

#  ttl {
#    attribute_name = "TimeToExist"
#    enabled        = false
#  }

  tags = {
    "Name"    = "Covid-Hackathon"
    "Project" = "Terraform"
  }
}

resource "aws_dynamodb_table_item" "example" {
  table_name = aws_dynamodb_table.dynamodb-table.name
  hash_key   = aws_dynamodb_table.dynamodb-table.hash_key
  range_key  = aws_dynamodb_table.dynamodb-table.range_key

  item = <<ITEM
{
  "useremailid": {"S": "manoj.c@gmail.com"},
  "userscantimestmp": {"N": "1592449289"},
  "userphnumber": {"N": "7675487767"},
  "usercategory": {"S": "personal"},
  "fellowphnumber": {"N": "8988778001"},
  "fellowcategory": {"S": "personal"},
  "fellowemailid": {"S": "manoj@gmail.com"}
}
ITEM
}