terraform {
  required_version = ">= 1.4.2"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.51.0"
    }

    cloudvps = { 
      source  = "terraform.wmcloud.org/registry/cloudvps"
      version = "~> 0.2.0"
    }
  }
}

provider "openstack" {
  auth_url                      = "${var.auth-url[var.datacenter]}"
  tenant_id                     = "testlabs"
  application_credential_id     = "${var.application_credential_id[var.datacenter]}"
  application_credential_secret = "${var.application_credential_secret[var.datacenter]}"
}

provider "cloudvps" {
  os_auth_url                      = "${var.auth-url[var.datacenter]}"
  os_project_id                    = "testlabs"
  os_application_credential_id     = "${var.application_credential_id[var.datacenter]}"
  os_application_credential_secret = "${var.application_credential_secret[var.datacenter]}"
}
