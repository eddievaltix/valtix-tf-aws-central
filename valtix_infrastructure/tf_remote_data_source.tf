//this datasource is to get the policy_rule_set_id from valtix_policy template
//currently you cannot data source this from the valtix_policy_rule_set resource so we must retrieve this from a remote state data source
data "terraform_remote_state" "valtix_policy" {
  backend = "s3"
  config = {
    bucket = var.tf_remote_state_bucket
    key    = var.tf_remote_state_valtix_policy_key
    region = var.tf_remote_state_region
  }
}

//this datasource is to get the valtix-firewall-role name output from the valtix_iam template.  
//you do not need this if you want to simply statically assign the firewall-role-name in valtix_gateway resource definition in gateway.tf
data "terraform_remote_state" "valtix_iam" {
  backend = "s3"
  config = {
    bucket = var.tf_remote_state_bucket
    key    = var.tf_remote_state_valtix_iam_key
    region = var.tf_remote_state_region
  }
}
