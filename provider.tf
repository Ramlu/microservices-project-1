terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.46.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.region
  access_key = "AKIA6ODUZ5SC7XWWLOP3"
  secret_key = "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"
}