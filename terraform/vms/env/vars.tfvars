vms = [ 
    {
        hostname = "basil" # Upstream Rancher cluster
        domain = "blahaj.sh"

        vcpu = 4
        memory = 6144

        cloudinit_image = "https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2"

        disk_size = 107374182400 # 100 GiB
        
        ssh_keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGSj6rJkx/d2w1c4qagmh7s/TJQHGOAanWprgiHzUKIW"
        ]

        dhcp = true

        libvirt_external_interface = "enp34s0"
        mac = "00:50:56:00:11:D4"

        spice_server_enabled = false

        ansible_groups = ["vm", "cloud", "upstream", "rancher"]
        ansible_user   = "debian"
        ansible_host   = "basil"
    },
    {
        hostname = "aubrey" # For my private use
        domain = "blahaj.sh"

        vcpu = 6
        memory = 24576

        cloudinit_image = "https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2"

        disk_size = 375809638400 # 350 GiB
        
        ssh_keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGSj6rJkx/d2w1c4qagmh7s/TJQHGOAanWprgiHzUKIW"
        ]

        dhcp = true

        libvirt_external_interface = "enp34s0"
        mac = "00:50:56:01:00:78"

        spice_server_enabled = false

        ansible_groups = ["vm", "cloud", "downstream", "personal"]
        ansible_user   = "debian"
        ansible_host   = "aubrey"
    },
    {
        hostname = "kel" # For services I host that need to be publically accessible
        domain = "blahaj.sh"

        vcpu = 4
        memory = 12288

        cloudinit_image = "https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2"

        disk_size = 107374182400 # 100 GiB
        
        ssh_keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGSj6rJkx/d2w1c4qagmh7s/TJQHGOAanWprgiHzUKIW"
        ]

        dhcp = true

        libvirt_external_interface = "enp34s0"
        mac = "00:50:56:00:EB:41"

        spice_server_enabled = false

        ansible_groups = ["vm", "cloud", "downstream", "public"]
        ansible_user   = "debian"
        ansible_host   = "kel"
    },
    {
        hostname = "hero" # For a group of people I'm working with, https://github.com/queercoded-dev
        domain = "queercoded.dev"

        vcpu = 4
        memory = 20480

        cloudinit_image = "https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2"

        disk_size = 322122547200 # 300 GiB
        
        ssh_keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGSj6rJkx/d2w1c4qagmh7s/TJQHGOAanWprgiHzUKIW"
        ]

        dhcp = true

        libvirt_external_interface = "enp34s0"
        mac = "00:50:56:00:8F:E9"

        spice_server_enabled = false

        ansible_groups = ["vm", "cloud", "downstream", "qc"]
        ansible_user   = "debian"
        ansible_host   = "hero"
    }
]
