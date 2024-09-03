resource "openstack_objectstorage_container_v1" "tf_container" {
  region = var.region[var.datacenter]
  name   = "tofu-test-container"

  metadata {
    tofu = "soy"
  }
}

resource "openstack_objectstorage_object_v1" "tofu_object" {
  region         = "RegionOne"
  container_name = openstack_objectstorage_container_v1.tf_container.name
  name           = "test/object.file"
  metadata {
    tofu = "soy"
  }

  content_type = "application/json"
  content      = "tofu test file"
}
