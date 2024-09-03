resource "openstack_objectstorage_container_v1" "tf_container" {
  name   = "tofu-test-container"
}

resource "openstack_objectstorage_object_v1" "tofu_object" {
  container_name = openstack_objectstorage_container_v1.tf_container.name
  name           = "tofu-test-directory/object.file"

  content      = "tofu test file"
}
