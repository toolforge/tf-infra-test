data "openstack_images_image_v2" "debian" {
  most_recent = true
  name        = "debian-11.0-bullseye"
}

resource "openstack_compute_instance_v2" "vm" {
  name            = "tf-infra-test"
  image_id        = data.openstack_images_image_v2.debian.id
  flavor_id       = var.flavor_id[var.datacenter] # update to lookup?
  security_groups = ["${openstack_compute_secgroup_v2.secgroup.name}", "default"]

  network {
    name = var.fixed_network[var.datacenter]
  }
}

variable "flavor_id" {
  type = map(any)
  default = {
    "codfw1dev" = "2be1dcfd-f5aa-4772-a097-6e65363e0710"
    "eqiad1"    = "8a752ca3-bffa-4fb3-b70f-30f6e29bc5cd"
  }
}
