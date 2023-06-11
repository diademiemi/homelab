variable "rancher_bootstrap_password" {
    description = "Rancher bootstrap password"
    default     = "password"
    type = string
}

variable "rancher_bootstrap_telemetry" {
    description = "Rancher bootstrap telemetry"
    default     = false
    type = bool
}

variable "rancher_url" {
    description = "Rancher bootstrap URL"
    default     = "https://rancher.example.com"
    type = string
}

variable "rancher_users" {
    description = "List of users to create"
    default     = []
    type = list(object({
        name = string
        username = string
        password = string
        enabled = bool
        role_id = string
    }))
} # Fed from Ansible so I can use Ansible Vault to encrypt the password

variable "rancher_clusters" {
    description = "List of downstream clusters to create"
    default     = []
    type = list(object({
        name = string
        fleet_namespace = string
        kubernetes_version = string
        enable_network_policy = optional(bool)
        default_cluster_role_for_project_members = optional(string)
    }))
}
