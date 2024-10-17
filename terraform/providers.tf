terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.69.0"
    }
    http = {
      source = "hashicorp/http"
      version = "3.4.5"
    }
  }
}

provider "aws" {
  region = var.region
}
