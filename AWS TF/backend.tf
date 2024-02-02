terraform {
  backend "s3" {
    bucket = "bhavitestawsdemo"
    key    = "Bhavi/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-lock"
  }
}

