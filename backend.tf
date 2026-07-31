terraform {
  backend "s3" {
    bucket = "saiec2demo"
    key    = "saiec2demo/terraform.tfstate"
    region = "us-east-1"
  }
}

