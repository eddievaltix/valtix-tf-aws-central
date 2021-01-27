//Terraform remote state data source variables
variable "tf_remote_state_bucket" {
  description = "Terraform remote state data source backend bucket for valtix_iam and valtix_policy"
}
variable "tf_remote_state_valtix_iam_key" {
  description = "Terraform remote state data source backend key for valtix_iam"
}
variable "tf_remote_state_region" {
  description = "Terraform remote state data source region"
}
variable "tf_remote_state_valtix_policy_key" {
  description = "Terraform remote state data source backend key for valtix_policy"
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
