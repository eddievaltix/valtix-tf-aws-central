// Define Valtix Service resources
resource "valtix_service_object" svc-egress-http {
  name           = "egress-http-80"
  service_type   = "ForwardProxy"
  transport_mode = "HTTP"
  port {
    destination_ports = "80"
  }
}

resource "valtix_service_object" svc-egress-https {
  name           = "egress-https-443"
  service_type   = "ForwardProxy"
  transport_mode = "HTTPS"
  port {
    destination_ports = "443"
  }
  tls_profile = valtix_profile_decryption.egress_decryption_profile_1.profile_id
}

resource "valtix_service_object" app1-svc-https {
  name           = "app1-svc-https"
  description    = "app1 service: listen on 443 and target to 443"
  service_type   = "ReverseProxy"
  protocol       = "TCP"
  transport_mode = "HTTPS"
  port {
    destination_ports = "443"
    backend_ports     = "443"
  }
  backend_address_group = valtix_address_object.static1-ag.address_id
  tls_profile           = valtix_profile_decryption.ingress_decryption_profile_1.profile_id
}