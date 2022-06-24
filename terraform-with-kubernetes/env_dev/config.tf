terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.64.2"
    }
  }
}

provider "aws" {
  region                  = var.aws_main_region
}

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "evilgn0me-test-org"

    workspaces {
      name = "test_dev"
    }
  }
}

data "terraform_remote_state" "essentials" {
  backend = "remote"

  config = {
    organization = "evilgn0me-test-org"
    workspaces = {
      name = "test_essentials"
    }
  }
}