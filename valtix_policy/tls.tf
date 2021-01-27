// Define TLS certificates and decryption profiles
resource "valtix_certificate" egress_cert_1 {
  name             = var.egress_cert_name
  certificate_type = "IMPORT_CONTENTS"
  certificate_body = file(var.egress_cert_body)
  private_key      = file(var.egress_cert_privatekey)
}

resource "valtix_certificate" ingress_cert_1 {
  name             = var.ingress_cert_name
  certificate_type = "IMPORT_CONTENTS"
  certificate_body = file(var.ingress_cert_body)
  private_key      = file(var.ingress_cert_privatekey)
}

resource "valtix_profile_decryption" egress_decryption_profile_1 {
  name             = var.egress_decryptprofile_name
  certificate_name = valtix_certificate.egress_cert_1.name
}

resource "valtix_profile_decryption" ingress_decryption_profile_1 {
  name             = var.ingress_decryptprofile_name
  certificate_name = valtix_certificate.ingress_cert_1.name
}

