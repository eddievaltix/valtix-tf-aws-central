resource "valtix_policy_rule_set" egress_policy_rule_set {
  name = var.egress_policy_ruleset_name
  rule {
    name                      = "egress-forwardproxy-http-allow"
    type                      = "ForwardProxy"
    action                    = "ALLOW_LOG"
    service                   = valtix_service_object.svc-egress-http.service_id
    description               = "allow all for prod vpc on port 80"
    source                    = valtix_address_object.vpc1-ag.address_id
    network_intrusion_profile = valtix_profile_network_intrusion.ips-balanced.profile_id
    url_filter                = valtix_profile_urlfilter.url-safelist.profile_id
    state                     = "ENABLED"
  }
  rule {
    name                      = "egress-forwardproxy-https-allow"
    type                      = "ForwardProxy"
    action                    = "ALLOW_LOG"
    service                   = valtix_service_object.svc-egress-https.service_id
    description               = "allow all for prod vpc on port 443"
    source                    = valtix_address_object.vpc1-ag.address_id
    network_intrusion_profile = valtix_profile_network_intrusion.ips-balanced.profile_id
    url_filter                = valtix_profile_urlfilter.url-safelist.profile_id
    state                     = "ENABLED"
  }
}

resource "valtix_policy_rule_set" ingress_policy_rule_set {
  name = var.ingress_policy_ruleset_name
  rule {
    name                      = "app1"
    description               = "listen port 443 to target port 443 on app1"
    type                      = "ReverseProxy"
    action                    = "ALLOW_LOG"
    service                   = valtix_service_object.app1-svc-https.service_id
    state                     = "ENABLED"
    web_protection_profile    = valtix_profile_application_threat.waf1.profile_id
    network_intrusion_profile = valtix_profile_network_intrusion.ips-balanced.profile_id
    malicious_src_profile     = valtix_profile_malicious_source.malicious-sources.profile_id
  }
}