resource "openstack_compute_secgroup_v2" "secgroup" {
  name        = "terraform-test"
  description = "security group deployed by terraform"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "127.0.0.1/32"
  }
}
