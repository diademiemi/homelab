# Configure the Rancher2 provider to bootstrap and admin
# Provider config for bootstrap

# Create a new rancher2_bootstrap using bootstrap provider config
resource "rancher2_bootstrap" "admin" {
  provider = rancher2.bootstrap

  initial_password = var.rancher_bootstrap_password
  telemetry = var.rancher_bootstrap_telemetry
}

resource "rancher2_cluster_v2" "personal" {
  provider = rancher2.admin

  name = "personal"
  fleet_namespace = "fleet-default"

  kubernetes_version = var.cluster_k3s_version

  enable_network_policy = false
  default_cluster_role_for_project_members = "user"
}

resource "rancher2_cluster_v2" "public" {
  provider = rancher2.admin

  name = "public"
  fleet_namespace = "fleet-default"

  kubernetes_version = var.cluster_k3s_version

  enable_network_policy = false
  default_cluster_role_for_project_members = "user"
}

resource "rancher2_cluster_v2" "qc" {
  provider = rancher2.admin

  name = "qc"
  fleet_namespace = "fleet-default"

  kubernetes_version = var.cluster_k3s_version

  enable_network_policy = false
  default_cluster_role_for_project_members = "user"
}

resource "rancher2_user" "users" {
  provider = rancher2.admin

  for_each = { for user in var.rancher_users : user.username => user }

  name = each.value.name
  username = each.value.username
  password = each.value.password
  enabled = each.value.enabled
}

resource "rancher2_global_role_binding" "foo" {
  provider = rancher2.admin

  for_each = { for user in var.rancher_users : user.username => user }

  name = each.value.name
  global_role_id = each.value.role_id
  user_id = rancher2_user.users[each.key].id
}
