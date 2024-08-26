variable "worker_flavor" {
  type = map(any)
  default = {
    "codfw1dev" = "g4.cores1.ram2.disk20"
    "eqiad1"    = "g4.cores1.ram2.disk20"
  }
}
variable "control_flavor" {
  type = map(any)
  default = {
    "codfw1dev" = "g4.cores1.ram2.disk20"
    "eqiad1"    = "g4.cores2.ram4.disk20"
  }
}
variable "external_network_id" {
  type = map(any)
  default = {
    "codfw1dev" = "wan-transport-codfw"
    "eqiad1"    = "wan-transport-eqiad"
  }
}
variable "fixed_network" {
  type = map(any)
  default = {
    "codfw1dev" = "lan-flat-cloudinstances2b"
    "eqiad1"    = "lan-flat-cloudinstances2b"
  }
}
variable "fixed_subnet" {
  type = map(any)
  default = {
    "codfw1dev" = "cloud-instances2-b-codfw"
    "eqiad1"    = "cloud-instances2-b-eqiad"
  }
}
variable "image_name" {
  type = map(any)
  default = {
    "codfw1dev" = "Fedora-CoreOS-34"
    "eqiad1"    = "Fedora-CoreOS-38"
  }
}

resource "openstack_containerinfra_cluster_v1" "k8s_127" {
  name                = "tf-infra-test-127"
  cluster_template_id = resource.openstack_containerinfra_clustertemplate_v1.template_127.id
  master_count        = 1
  node_count          = 1
}

resource "openstack_containerinfra_clustertemplate_v1" "template_127" {
  name                  = "tf-infra-test-127"
  coe                   = "kubernetes"
  dns_nameserver        = "8.8.8.8"
  docker_storage_driver = "overlay2"
  docker_volume_size    = "10"
  external_network_id   = var.external_network_id[var.datacenter]
  fixed_subnet          = var.fixed_subnet[var.datacenter]
  fixed_network         = var.fixed_network[var.datacenter]
  flavor                = var.worker_flavor[var.datacenter]
  floating_ip_enabled   = "false"
  image                 = var.image_name[var.datacenter]
  master_flavor         = var.control_flavor[var.datacenter]
  network_driver        = "calico"

  labels = {
    kube_tag                       = "v1.27.8-rancher2"
    container_runtime              = "containerd"
    containerd_version             = "1.6.28"
    containerd_tarball_sha256      = "f70736e52d61e5ad225f4fd21643b5ca1220013ab8b6c380434caeefb572da9b"
    cloud_provider_tag             = "v1.27.3"
    cinder_csi_plugin_tag          = "v1.27.3"
    k8s_keystone_auth_tag          = "v1.27.3"
    magnum_auto_healer_tag         = "v1.27.3"
    octavia_ingress_controller_tag = "v1.27.3"
    calico_tag                     = "v3.26.4"
  }
}
