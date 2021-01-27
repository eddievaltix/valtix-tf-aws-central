# valtix-tf-aws-central
This is an example Terraform template that will deploy a centralized ingress and egress Valtix gateway

Resources are split into separate TF files in order to simplify adding and removing resources as needed.

# Valtix Terraform Centralized Ingress & Egress gateway Example Template
This Terraform template creates a Valtix ingress and egress gateways in a centralized inspection architecture.  The templates are split into the following template folders:

## valtix_iam
This template creates the IAM policies and roles required for Valtix controller to work with the AWS account as well as the account registration on the Valtix controller.  This is created in a separate template as these resources tend to be more mostly static in a deployment.  

## valtix_policy
This template creates example IPS, WAF, Malicious Sources profiles, address objects, services, rules and policy rulesets.  The reason why this was created as a separate template is that these resources tend to be more dynamic in most deployments.

## valtix_infrastructure
This template creates the Valtix Services VPC and Valtix Gateways in the account.  The reason why this is created as a separate template is that these resources tend to be static in most deployments. The Valtix gateway deployment expects that a EC2 keypair has already been created and the name of the keypair should be referenced in terraform.tfvars

*(Note) This template has dependencies on outputs from the valtix_iam and valtix_policy templates.  The best way to reference these outputs is to store remote state for valtix_iam and valtix_policy using a remote state backend like S3.  For more information on how to do this go to [link](https://blog.gruntwork.io/how-to-manage-terraform-state-28f5697e68fa).  The template assumes that it is accessing resources from a remote backend data source*

## How to use:
1. git clone this repo
1. use the terraform_tfvars.example files to create a terraform.tfvars file
1. declare a Terraform backend for remote state by creating a terraform_remote_state.tf with the following example code block for each of the template folders.  Remember to use a different key attribute for each template folder
```
terraform {
  backend "s3" {
    bucket         = "my_s3_bucket"
    key            = "valtix-tf-aws-central/valtix_iam/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "my_dynamodb_table"
    encrypt        = true
  }
}
```
1. run terraform init, terraform plan, terraform apply