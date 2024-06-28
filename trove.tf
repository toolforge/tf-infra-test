variable "network_uuid" {
  type = map(any)
  default = {
    "codfw1dev" = "05a5494a-184f-4d5c-9e98-77ae61c56daa" # lan-flat-cloudinstances2b
    "eqiad1"    = "7425e328-560c-4f00-8e99-706f3fb90bb4" # lan-flat-cloudinstances2b
  }
}
variable "db_flavor_uuid" {
  type = map(any)
  default = {
    "codfw1dev" = "0e38db8b-e6bb-49e1-82d8-e38a4e914caa"
    "eqiad1"    = "41f0ea41-75ca-44a6-be66-bb56b2a90721"
  }
}
variable "region" {
  type = map(any)
  default = {
    "codfw1dev" = "codfw1dev-r"
    "eqiad1"    = "eqiad1-r"
  }
}
variable "db_size" {
  type = map(any)
  default = {
    "codfw1dev" = "1"
    "eqiad1"    = "2"
  }
}
variable "maria_version" {
  type = map(any)
  default = {
    "codfw1dev" = "10.6.1"
    "eqiad1"    = "10.5.10"
  }
}
variable "mysql_version" {
  type = map(any)
  default = {
    "codfw1dev" = "5.7.29"
    "eqiad1"    = "5.7.29"
  }
}
variable "psql_version" {
  type = map(any)
  default = {
    "codfw1dev" = "13.3"
    "eqiad1"    = "12.7"
  }
}

resource "openstack_db_instance_v1" "postgresql" {
  region    = var.region[var.datacenter]
  name      = "tf-postgresql"
  flavor_id = var.db_flavor_uuid[var.datacenter]
  size      = var.db_size[var.datacenter]

  network {
    uuid = var.network_uuid[var.datacenter]
  }

  user {
    name      = "infra"
    host      = "%"
    password  = "notapassword"
    databases = ["tf-postgresql"]
  }

  database {
    name = "tf-postgresql"
  }

  datastore {
    version = var.psql_version[var.datacenter]
    type    = "postgresql"
  }
}

resource "openstack_db_instance_v1" "mysql" {
  region    = var.region[var.datacenter]
  name      = "tf-mysql"
  flavor_id = var.db_flavor_uuid[var.datacenter]
  size      = var.db_size[var.datacenter]

  network {
    uuid = var.network_uuid[var.datacenter]
  }

  user {
    name      = "infra"
    host      = "%"
    password  = "notapassword"
    databases = ["tf-mysql"]
  }

  database {
    name = "tf-mysql"
  }

  datastore {
    version = var.mysql_version[var.datacenter]
    type    = "mysql"
  }
}

resource "openstack_db_instance_v1" "mariadb" {
  region    = var.region[var.datacenter]
  name      = "tf-mariadb"
  flavor_id = var.db_flavor_uuid[var.datacenter]
  size      = var.db_size[var.datacenter]

  network {
    uuid = var.network_uuid[var.datacenter]
  }

  user {
    name      = "infra"
    host      = "%"
    password  = "notapassword"
    databases = ["tf-mariadb"]
  }

  database {
    name = "tf-mariadb"
  }

  datastore {
    version = var.maria_version[var.datacenter]
    type    = "mariadb"
  }
}
