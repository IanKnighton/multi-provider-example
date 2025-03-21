terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# The us-east-1 instance
provider "aws" {
  region = "us-east-1"
}

# The us-west-1 instance
provider "aws" {
  alias  = "west-1"
  region = "us-west-1"
}

# Create a bucket in us-east-1
resource "aws_s3_bucket" "east_1_example" {
  bucket = "east-1-example"

  tags = {
    Environment = "Dev"
  }
}

# Create a bucket in us-west-1
resource "aws_s3_bucket" "west_1_bucket" {
  provider = aws.west-1
  bucket   = "west-1-example"

  tags = {
    Environment = "Dev"
  }
}
