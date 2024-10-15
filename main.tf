
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.69.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }

}

provider "aws" {
  region = "ap-south-1"
}

resource "random_id" "rand_id" {
  byte_length = 10
}

resource "aws_s3_bucket" "demo-bucket" {
  bucket = "tf-cloud-${terraform.workspace}-${random_id.rand_id.hex}"
}
