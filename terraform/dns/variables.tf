variable "cloudflare_api_token" {
    description = "Cloudflare API token"
    type = string
}

variable "dns_records" {
    description = "List of DNS records to create"
    default     = []
    type = list(object({
        zone_id = string
        name = string
        value = string
        type = string
        ttl = number
        proxied = bool
        allow_overwrite = bool
    }))
}

# dns_records = [
#     {
#         zone_id = "xxx"
#         name = "omori"
#         value = "10.20.30.40"
#         type = "A"
#         ttl = 1
#         proxied = false
#         allow_overwrite = true
#     }
# ]
# But I give this through Ansible so I can dynamically get the IPs
