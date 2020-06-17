#-------------dynamodb/main.tf------------
# TLDR;
# If you store your dates / timestamps as ISO 8601 format, you should use String.
# If you store your dates / timestamps in Epoch format, you should use Number.
#--------------------------------------------------------------------------------

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "trackerDB"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "userphonenumber"
  range_key      = "userenrolltime"

  attribute {
    name = "userphonenumber"
    type = "S"
  }

  # Epoch format
  attribute {
    name = "usercontacttimestmp"
    type = "N"
  }

  attribute {
    name = "userecategory"
    type = "S"
  }

  attribute {
    name = "useremailid"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  global_secondary_index {
    name               = "GameTitleIndex"
    hash_key           = "GameTitle"
    range_key          = "TopScore"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserId"]
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}