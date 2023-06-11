provider "rancher2" {
  alias = "bootstrap"

  api_url   = var.rancher_url
  bootstrap = true
  insecure = true
}

provider "rancher2" {
  alias = "admin"

  api_url = var.rancher_url
  token_key = rancher2_bootstrap.admin.token
  insecure = true
}
