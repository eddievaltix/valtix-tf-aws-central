// Define Terraform remote state backend
terraform {
  backend "s3" {
    bucket         = var.tf_backend_bucket
    key            = var.tf_backend_key
    region         = var.tf_backend_region
    dynamodb_table = var.tf_dynamodb_table_name
    encrypt        = true
  }
}

// Define both AWS and Valtix Terraform Resource Providers
terraform {
  required_providers {
    valtix = {
      source  = "valtix-security/valtix"
      version = "2.5.1"
    }
  }
}

provider "aws" {
  profile = var.aws_profile_name_security
  region  = var.region
  version = "~> 3.25.0"
}

provider "valtix" {
  acctname     = var.valtix_account_name
  server       = var.valtix_controller_url
  port         = var.valtix_controller_port
  api_key_file = file(var.valtix_key_file)
}