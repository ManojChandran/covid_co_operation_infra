#------------cognito/main.tf---------

resource "aws_cognito_user_pool" "pool" {
  name = "mypool"

  alias_attributes         = ["email"]
  auto_verified_attributes = ["email"]

  password_policy {
    minimum_length    = 10
    require_lowercase = false
    require_numbers   = true
    require_symbols   = false
    require_uppercase = true

    temporary_password_validity_days = 9
  }

  tags = {
    "Name"    = "Covid-Hackathon"
    "Project" = "Terraform"
  }
}