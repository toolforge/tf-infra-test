data "openstack_images_image_v2" "debian" {
  most_recent = true
  name        = "debian-11.0-bullseye"
}

resource "openstack_compute_instance_v2" "vm" {
  name            = "testlabs-tf"
  image_id        = data.openstack_images_image_v2.debian.id
  flavor_id       = "bb8bee7e-d8f9-460b-8344-74f745c139b9" # update to lookup?
  security_groups = ["${openstack_compute_secgroup_v2.secgroup.name}"]

  network {
    name = var.fixed_network[var.datacenter]
  }
}
