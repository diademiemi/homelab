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

variable "cluster_k3s_version" {
    description = "K3s version"
    default     = "v1.25.9+k3s1"
    type = string
}
