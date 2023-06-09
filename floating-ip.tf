resource "openstack_networking_floatingip_v2" "floating_ip" {
  pool        = "wan-transport-eqiad"
  description = "terraform test IP"
}

resource "openstack_compute_floatingip_associate_v2" "floating_ip" {
  floating_ip = "${openstack_networking_floatingip_v2.floating_ip.address}"
  instance_id = "${resource.openstack_compute_instance_v2.vm.id}"
}
