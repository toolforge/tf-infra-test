resource "openstack_blockstorage_volume_v3" "volume" {
  region      = var.region[var.datacenter]
  name        = "volume_tf"
  description = "test volume deployed with tofu"
  size        = 3
}

resource "openstack_compute_volume_attach_v2" "va_1" {
  instance_id = resource.openstack_compute_instance_v2.vm.id
  volume_id   = openstack_blockstorage_volume_v3.volume.id
}
