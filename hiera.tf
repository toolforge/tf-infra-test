resource "cloudvps_puppet_prefix" "terraform" {
  name = "terraform-"

  roles = [
    "profile::terraform::tf"
  ]

  hiera = file("hiera-terraform.yaml")
}
