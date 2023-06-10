vms = [ 
    {
        hostname = "aubrey" # For my private use
        domain = "blahaj.sh"

        vcpu = 6
        memory = 20480

        cloudinit_image = "https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2"

        disk_size = 375809638400 # 350 GiB
        
        ssh_keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGSj6rJkx/d2w1c4qagmh7s/TJQHGOAanWprgiHzUKIW"
        ]

        dhcp = true

        libvirt_external_interface = "enp34s0"
        mac = "00:50:56:01:00:78"

        spice_server_enabled = false

        ansible_groups = ["cloud", "hetzner_vm", "vm1"]
        ansible_user   = "debian"
        ansible_host   = "aubrey"
    },
    {
        hostname = "kel" # For services I host that need to be publically accessible
        domain = "blahaj.sh"

        vcpu = 6
        memory = 16384

        cloudinit_image = "https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2"

        disk_size = 107374182400 # 100 GiB
        
        ssh_keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGSj6rJkx/d2w1c4qagmh7s/TJQHGOAanWprgiHzUKIW"
        ]

        dhcp = true

        libvirt_external_interface = "enp34s0"
        mac = "00:50:56:00:EB:41"

        spice_server_enabled = false

        ansible_groups = ["cloud", "hetzner_vm", "vm2"]
        ansible_user   = "debian"
        ansible_host   = "kel"
    },
    {
        hostname = "hero" # For a group of people I'm working with, https://github.com/queercoded-dev
        domain = "queercoded.dev"

        vcpu = 4
        memory = 16384

        cloudinit_image = "https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2"

        disk_size = 375809638400 # 350 GiB
        
        ssh_keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGSj6rJkx/d2w1c4qagmh7s/TJQHGOAanWprgiHzUKIW"
        ]

        dhcp = true

        libvirt_external_interface = "enp34s0"
        mac = "00:50:56:00:8F:E9"

        spice_server_enabled = false

        ansible_groups = ["cloud", "hetzner_vm", "vm3"]
        ansible_user   = "debian"
        ansible_host   = "hero"
    }
]
