//Valtix IAM Terraform remote state data source
variable "valtix_iam_tf_remote_state_bucket" {
  description = "Valtix IAM Terraform remote state S3 bucket"
}
variable "valtix_iam_tf_remote_state_key" {
  description = "Valtix IAM Terraform remote state S3 bucket key"
}
variable "valtix_iam_tf_remote_state_region" {
  description = "Valtix IAM Terraform remote state region"
}

//provider variables
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
