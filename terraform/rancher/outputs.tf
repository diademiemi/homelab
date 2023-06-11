output "cluster_personal_token" {
  value = rancher2_cluster_v2.personal.cluster_registration_token[0].token
  sensitive = true
}

output "cluster_personal_node_command" {
  value = rancher2_cluster_v2.personal.cluster_registration_token[0].insecure_node_command
  sensitive = true
}

output "cluster_public_token" {
  value = rancher2_cluster_v2.public.cluster_registration_token[0].token
  sensitive = true
}

output "cluster_public_node_command" {
  value = rancher2_cluster_v2.public.cluster_registration_token[0].insecure_node_command
  sensitive = true
}

output "cluster_qc_token" {
  value = rancher2_cluster_v2.qc.cluster_registration_token[0].token
  sensitive = true
}

output "cluster_qc_node_command" {
  value = rancher2_cluster_v2.qc.cluster_registration_token[0].insecure_node_command
  sensitive = true
}
