output "rancher_cluster_tokens" {
  value = {
    for cluster in rancher2_cluster_v2.clusters : cluster.name => cluster.cluster_registration_token[0].token
  }
  sensitive = true

}

output "rancher_cluster_node_commands" {
  value = {
    for cluster in rancher2_cluster_v2.clusters : cluster.name => cluster.cluster_registration_token[0].insecure_node_command
  }
  sensitive = true

}