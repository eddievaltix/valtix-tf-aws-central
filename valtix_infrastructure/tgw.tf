// Create a Transit Gateway
resource "aws_ec2_transit_gateway" tgw {
  description                     = "Valtix deployed transit gateway in ${var.region}"
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  tags = {
    Name = var.transit_gateway_name
  }
}