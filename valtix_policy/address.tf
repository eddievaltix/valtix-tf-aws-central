// Define Address Objects
resource "valtix_address_object" static1-ag {
  name            = "Static-App1"
  description     = "Example Static Backend Address Object"
  type            = "STATIC"
  value           = [var.addr_static1_ip]
  backend_address = true
}

resource "valtix_address_object" vpc1-ag {
  name             = "Dynamic-VPC1"
  description      = "Backend VPC"
  type             = "DYNAMIC_VPC"
  vpc_id           = var.addr_vpc_id
  csp_account_name = var.cloud_account_name
  region           = var.region
}


