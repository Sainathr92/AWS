terraform {
 required_providers {
   aws = {
     source = "hashicorp/aws"
     version = "~> 5.0"
   }
 }
}
provider "aws" {
 region = "us-east-1"
}
resource "aws_instance" "free_tier" {
 ami = "ami-02b64aa047cb5edf5" # Amazon Linux Server 2023 LTS
 instance_type = "t3.micro" # Free Tier eligible
}
