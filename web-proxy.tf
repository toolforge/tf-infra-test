resource "cloudvps_web_proxy" "web_proxy" {
  hostname = "tf-infra-test"
  backends = ["http://${resource.openstack_compute_instance_v2.vm.access_ip_v4}:8888"]
}
