resource "cloudvps_web_proxy" "web_proxy" {
  hostname = "testlabs-tf"
  backends = ["http://${resource.openstack_compute_instance_v2.vm.access_ip_v4}:8888"]
}
