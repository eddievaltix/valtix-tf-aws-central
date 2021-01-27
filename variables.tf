//Terraform S3 DynamoDB remote state backend variables
variable "tf_backend_bucket" {
  description = "S3 bucket name for Terraform backend"
}
variable "tf_backend_key" {
  description = "remote state S3 object key.  Enter the object path and Terraform state file name"
}
variable "tf_backend_region" {
  description = "region where Terraform DynamoDB table is configured for file locking"
}
variable "tf_dynamodb_table_name" {
  description = "DynamoDB table name used for Terraform remote state backend"
}

//provider variables
variable "aws_profile_name_security" {
  description = "AWS profile credentials used to establish connection to AWS Network Security Account where Valtix is deployed"
}
variable "valtix_account_name" {
  description = "account name provided by Valtix"
}
variable "valtix_controller_url" {
  description = "Valtix controller URL provided by Valtix"
}
variable "valtix_controller_port" {
  description = "this is the Valtix controller API port"
  default     = "8091"
}
variable "valtix_key_file" {
  description = "this is the relative path and filename to the Valtix API key file"
}

//iam and cloud account variables
variable "iam_prefix" {
  description = "prefix to apply to Valtix IAM roles"
  default     = "valtix"
}
variable "controller_account_number" {
  description = "AWS controller account number provided by Valtix"
}
variable "account_number" {
  description = "AWS account where Valtix will be deployed"
}
variable "external_id" {
  description = "external ID found in AWS account creation in Valtix UI"
}
variable "region" {
  description = "AWS region to deploy Valtix"
}
variable "cloud_account_name" {
  description = "Valtix cloud account name"
}

//service vpc variables
variable "services_vpc_ingress_name" {
  description = "name of ingress Valtix Services VPC"
}
variable "services_vpc_egress_name" {
  description = "name of egress Valtix Services VPC"
}
variable "ingress_cidr" {
  description = "CIDR block for ingress services VPC"
}
variable "egress_cidr" {
  description = "CIDR block for egress services VPC"
}
variable "availability_zones" {
  description = "List of Availability Zones for services VPC"
}

//address objects
variable "addr_vpc_id" {
  description = "VPC ID for Dynamic VPC Address Object"
}
variable "addr_static1_ip" {
  description = "App1 IP for Static Address Object"
}

//TLS certificate for Ingress & Egress
variable "ingress_cert_name" {
  description = "friendly name in Valtix for ingress certificate"
}
variable "ingress_cert_body" {
  description = "relative path and filename to ingress certificate body"
}
variable "ingress_cert_privatekey" {
  description = "relative path and filename to ingress certificate private key"
}
variable "egress_cert_name" {
  description = "friendly name in Valtix for egress certificate"
}
variable "egress_cert_body" {
  description = "relative path and filename to ingress certificate body"
}
variable "egress_cert_privatekey" {
  description = "relative path and filename to ingress certificate private key"
}
variable "ingress_decryptprofile_name" {
  description = "decryption profile name associated with ingress certificate"
}
variable "egress_decryptprofile_name" {
  description = "decryption profile name associated with egress certificate"
}

//policy ruleset variables
variable "ingress_policy_ruleset_name" {
  description = "name of ingress policy ruleset"
}
variable "egress_policy_ruleset_name" {
  description = "name of egress policy ruleset"
}

//transit gateway variable
variable "transit_gateway_name" {
  description = "name of Transit Gateway deployed by Valtix"
}

//Valtix gateway variables
variable "valtix_ingress_gw_name" {
  description = "name of Valtix ingress gateway"
}
variable "valtix_egress_gw_name" {
  description = "name of Valtix ingress gateway"
}
variable "gw_keypair_name" {
  description = "name of EC2 keypair to use to deploy Valtix gateways"
}
