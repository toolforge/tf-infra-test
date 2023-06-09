variable "network_uuid" {
  type = map
  default = {
    "codfw1dev" = "05a5494a-184f-4d5c-9e98-77ae61c56daa" # lan-flat-cloudinstances2b
    "eqiad1"    = "7425e328-560c-4f00-8e99-706f3fb90bb4" # lan-flat-cloudinstances2b
  }
}
variable "db_flavor_uuid" {
  type = map
  default = {
    "codfw1dev" = "5b2ca632-2ea0-4007-9b40-4f84f8e2428b"
    "eqiad1"    = "55d5d90f-c5c6-44ff-bb8a-be7b077481cf"
  }
}
variable "region" {
  type = map
  default = {
    "codfw1dev" = "codfw1dev-r"
    "eqiad1"    = "eqiad1-r"
  }
}
variable "db_size" {
  type = map
  default = {
    "codfw1dev" = "1"
    "eqiad1"    = "4"
  }
}

resource "openstack_db_instance_v1" "db_123" {
  region    = "${var.region[var.datacenter]}"
  name      = "testlabs-123"
  flavor_id = "${var.db_flavor_uuid[var.datacenter]}"
  size      = "${var.db_size[var.datacenter]}"

  network {
    uuid = "${var.network_uuid[var.datacenter]}"
  }

  user {
    name      = "testlabs-123"
    host      = "%"
    password  = "notapassword"
    databases = ["testlabs-123"]
  }

  database {
    name     = "testlabs-123"
  }

  datastore {
    version = "5.7.29"
    type    = "mysql"
  }
}