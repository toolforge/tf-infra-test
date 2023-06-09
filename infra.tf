resource "openstack_blockstorage_volume_v3" "volume" {
  region      = "${var.region[var.datacenter]}"
  name        = "volume_tf"
  description = "test volume deployed with terraform"
  size        = 3
}
