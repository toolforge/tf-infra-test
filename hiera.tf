resource "cloudvps_puppet_prefix" "tofu" {
  name = "tofu-"

  roles = [
    "profile::tofu::tf"
  ]

  hiera = file("hiera-tofu.yaml")
}
