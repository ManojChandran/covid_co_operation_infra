#------------apigateway/main.tf---------

resource "aws_api_gateway_rest_api" "trakerAPI" {
  name        = "trakerAPI"
  description = "This is my API for demonstration purposes"

  tags = {
    "Name"    = "Covid-Hackathon"
    "Project" = "Terraform"
  }

}

resource "aws_api_gateway_resource" "trackerAPIResource" {
  rest_api_id = aws_api_gateway_rest_api.trakerAPI.id
  parent_id   = aws_api_gateway_rest_api.trakerAPI.root_resource_id
  path_part   = "trackersource"
}