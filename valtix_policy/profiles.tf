
###########################
# Malicious Sources Profile
###########################

resource "valtix_profile_malicious_source" malicious-sources {
  name                  = "malicious-sources1"
  description           = "profile for known malicious sources"
  ip_reputation_enabled = true
  vendor_rule_set_name  = "1.0.0-11112019"
}

##############
# IPS Profiles
##############
resource "valtix_profile_network_intrusion" ips-security {
  name                  = "ips-security"
  talos_ruleset_version = "2.9.11-05072019"
  policy                = "SECURITY"
  policy_action         = "DROP"
}


resource "valtix_profile_network_intrusion" ips-balanced {
  name                  = "ips-balanced"
  talos_ruleset_version = "2.9.11-05072019"
  policy                = "BALANCED"
  policy_action         = "ALERT"
}


resource "valtix_profile_network_intrusion" ips-connectivity {
  name                  = "ips-connectivity"
  talos_ruleset_version = "2.9.11-05072019"
  policy                = "CONNECTIVITY"
  policy_action         = "ALERT"
}


resource "valtix_profile_network_intrusion" ips-maxdetect {
  name                  = "ips-maxdetect"
  talos_ruleset_version = "2.9.11-05072019"
  policy                = "MAX_DETECT"
  #policy_action         = "ALERT"
}

#############
# URL Filters
#############

resource "valtix_profile_urlfilter" url-safelist {
  name = "url-safelist"
  url_filter_list {
    url            = "https://www.google.com.*"
    filter_methods = ["GET", "DELETE"]
    policy         = "ALLOW_LOG"
  }
  default_url_filter {
    policy        = "DENY"
    return_status = "500"
  }
}

#############
# DLP Profile
#############


resource "valtix_profile_dlp" "dlp-ssn" {
  name        = "dlp-ssn"
  description = "DLP profile to detect US Social Security Number"
  dlp_filter_list {
    description = "SSN"
    patterns = [
      "USSOCIAL"
    ]
    count  = 1
    action = "DROP"
  }
}

#############
# WAF Profile
#############
resource "valtix_profile_application_threat" waf1 {
  name                      = "waf1"
  description               = "waf basic rules"
  crs_ruleset_version       = "3.0.2-08262020"
  trustwave_ruleset_version = "3.0.2-08262020"
  paranoia_level            = 1
  action                    = "DETECT"
  request_inspection_profile = [
    "Request - Protocol Enforcement"
  ]
}