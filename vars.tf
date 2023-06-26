variable "datacenter" {
  type    = string
  default = "eqiad1"
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
    "codfw1dev" = "<needed>"
    "eqiad1"    = "53e844d312eb40fb9c837d9bcc469b27"
  }
}
