// Create Valtix Ingress and Egress Gateways
resource "valtix_gateway" gw-ingress {
  name                  = var.valtix_ingress_gw_name
  description           = "Valtix Gateway in ${var.region}"
  csp_account_name      = var.cloud_account_name
  instance_type         = "AWS_M5_2XLARGE"
  gateway_image         = "default"
  mode                  = "HUB"
  security_type         = "INGRESS"
  policy_rule_set_id    = data.terraform_remote_state.valtix_policy.outputs.ingress_policy_ruleset_id
  ssh_key_pair          = var.gw_keypair_name
  aws_iam_role_firewall = data.terraform_remote_state.valtix_iam.outputs.valtix_firewall_role_name
  region                = var.region
  vpc_id                = valtix_service_vpc.service_vpc_ingress.id
  transit_gateway_id    = aws_ec2_transit_gateway.tgw.id
}

resource "valtix_gateway" gw-egress {
  name                  = var.valtix_egress_gw_name
  description           = "Valtix Gateway in ${var.region}"
  csp_account_name      = var.cloud_account_name
  instance_type         = "AWS_M5_2XLARGE"
  gateway_image         = "default"
  mode                  = "HUB"
  security_type         = "EGRESS"
  policy_rule_set_id    = data.terraform_remote_state.valtix_policy.outputs.egress_policy_ruleset_id
  ssh_key_pair          = var.gw_keypair_name

  aws_iam_role_firewall = data.terraform_remote_state.valtix_iam.outputs.valtix_firewall_role_name
  region                = var.region
  vpc_id                = valtix_service_vpc.service_vpc_egress.id
  transit_gateway_id    = aws_ec2_transit_gateway.tgw.id
  aws_gateway_lb        = "true" //this should be set only if deploying in regions where gateway load balancer is supported
}