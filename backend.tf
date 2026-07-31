terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-1"
    key    = "saiec2demo/terraform.tfstate"
    region = "us-east-1"
  }
}
``
