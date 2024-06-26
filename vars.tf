variable "datacenter" {
  type = string
}

# connection vars
variable "auth-url" {
  type = map(any)
  default = {
    "codfw1dev" = "https://openstack.codfw1dev.wikimediacloud.org:25000"
    "eqiad1"    = "https://openstack.eqiad1.wikimediacloud.org:25000"
  }
}
variable "application_credential_id" {
  type = map(any)
  default = {
    "codfw1dev" = "2160edfdfdfd4a14abd29feb903a35a2"
    "eqiad1"    = "96017b958d5341b9a5903e7e611fe59c"
  }
}
variable "project" {
  type = map(any)
  default = {
    "codfw1dev" = "tf-infra-dev"
    "eqiad1"    = "tf-infrat-test"
  }
}
