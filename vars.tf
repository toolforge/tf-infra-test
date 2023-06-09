variable "datacenter" {
  type = string
  default = "eqiad1"
}

# connection vars
variable "auth-url" {
  type = map
  default = {
    "codfw1dev" = "https://openstack.codfw1dev.wikimediacloud.org:25000"
    "eqiad1"    = "https://openstack.eqiad1.wikimediacloud.org:25000"
  }
}
variable "application_credential_id" {
  type = map
  default = {
    "codfw1dev" = "<needed>"
    "eqiad1"    = "ab79da04abd64da3ae563926eee7e66b"
  }
}
