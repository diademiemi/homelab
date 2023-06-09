variable "libvirt_uri" {
    description = "Libvirt URI"
    default     = "qemu:///system"
    type = string
}

variable "vms" {
    description = "List of VMs to create"
    default     = []
    type = list(object({
        hostname = string
        domain = string

        vcpu = number
        memory = number

        cloudinit_image = string

        disk_size = optional(number)
        libvirt_pool = optional(string)
        disk_passthroughs = optional(list(string))
        
        ssh_keys = list(string)

        dhcp = bool
        ip = optional(string)
        gateway = optional(string)
        mac = optional(string)

        libvirt_external_interface = optional(string)

        spice_server_enabled = optional(bool)

        ansible_host = optional(string)
        ansible_groups = optional(list(string))
        ansible_user = optional(string)

    }))
}
