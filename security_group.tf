resource "openstack_compute_secgroup_v2" "secgroup" {
  name        = "tofu-test"
  description = "security group deployed by tofu"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "127.0.0.1/32"
  }
}
