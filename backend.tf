terraform {

  backend "s3" {

    bucket = "akash-terraform-state-91936362"

    key = "terraform.tfstate"

    region = "us-east-1"

    dynamodb_table = "terraform-lock"

    encrypt = true

  }

}