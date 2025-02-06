provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "sports-nba-richards-highlights"  # S3 bucket for remote state
    key            = "terraform.tfstate"               # State file name
    region         = "us-east-1"                       # AWS region
    encrypt        = true                              # Enable encryption for security
  }
}

