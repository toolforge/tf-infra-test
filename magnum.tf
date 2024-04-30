variable "worker_flavor" {
  type = map(any)
  default = {
    "codfw1dev" = "g3.cores1.ram2.disk20"
    "eqiad1"    = "g3.cores1.ram2.disk20"
  }
}
variable "control_flavor" {
  type = map(any)
  default = {
    "codfw1dev" = "g3.cores1.ram2.disk20"
    "eqiad1"    = "g3.cores2.ram4.disk20"
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
    "eqiad1"    = "magnum-fedora-coreos-34"
  }
}

resource "openstack_containerinfra_cluster_v1" "k8s_126" {
  name                = "tf-infra-test-126"
  cluster_template_id = resource.openstack_containerinfra_clustertemplate_v1.template_126.id
  master_count        = 1
  node_count          = 1
}

resource "openstack_containerinfra_clustertemplate_v1" "template_126" {
  name                  = "tf-infra-test-126"
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
  network_driver        = "flannel"

  labels = {
    kube_tag                  = "v1.26.8-rancher1"
    container_runtime         = "containerd"
    containerd_version        = "1.6.20"
    containerd_tarball_sha256 = "1d86b534c7bba51b78a7eeb1b67dd2ac6c0edeb01c034cc5f590d5ccd824b416"
    hyperkube_prefix          = "docker.io/rancher/"
    cloud_provider_enabled    = "true"
  }
}
