vms = [ 
    {
        hostname = "basil" # Upstream Rancher cluster
        domain = "blahaj.sh"

        vcpu = 4
        memory = 16384

        cloudinit_image = "https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2"

        disk_size = 107374182400 # 100 GiB
        
        ssh_keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGSj6rJkx/d2w1c4qagmh7s/TJQHGOAanWprgiHzUKIW"
        ]

        dhcp = true

        network_interfaces = [
            {
                name = "ens3"
                macvtap = "eno1"
                mac = "00:50:56:00:04:52"

                additional_routes = [
                    {
                        network = "0.0.0.0/0"
                        gateway = "5.9.32.193"
                    }
                ]

            },
            {
                name = "ens4"
                network_name = "local_net"

                dhcp = false
                ip = "192.168.51.11/24"
                gateway = "192.168.51.1"

                additional_routes = [
                    {
                        network = "192.168.100.128/26"
                        gateway = "192.168.51.1"
                    }
                ]

            },
        ]

        spice_server_enabled = false

        ansible_groups = ["vm", "cloud", "upstream", "rancher"]
        ansible_user   = "debian"
        ansible_host   = "basil"
    },
    {
        hostname = "aubrey" # For my private use
        domain = "blahaj.sh"

        vcpu = 10
        memory = 49152

        cloudinit_image = "https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2"

        disk_size = 375809638400 # 350 GiB
        
        ssh_keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGSj6rJkx/d2w1c4qagmh7s/TJQHGOAanWprgiHzUKIW"
        ]

        dhcp = true

        network_interfaces = [
            {
                name = "ens3"
                macvtap = "eno1"
                mac = "00:50:56:00:07:CF"

                additional_routes = [
                    {
                        network = "0.0.0.0/0"
                        gateway = "5.9.32.193"
                    }
                ]

            },
            {
                name = "ens4"
                network_name = "local_net"

                dhcp = false
                ip = "192.168.51.12/24"
                gateway = "192.168.51.1"

                additional_routes = [
                    {
                        network = "192.168.100.128/26"
                        gateway = "192.168.51.1"
                    },
                    {
                        network = "10.107.0.0/16"
                        gateway = "192.168.51.1"
                    }
                ]

            },
        ]

        spice_server_enabled = true

        ansible_groups = ["vm", "cloud", "downstream", "personal"]
        ansible_user   = "debian"
        ansible_host   = "aubrey"
    },
    {
        hostname = "kel" # For services I host that need to be publically accessible
        domain = "blahaj.sh"

        vcpu = 6
        memory = 24576

        cloudinit_image = "https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2"

        disk_size = 107374182400 # 100 GiB
        
        ssh_keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGSj6rJkx/d2w1c4qagmh7s/TJQHGOAanWprgiHzUKIW"
        ]

        dhcp = true

        network_interfaces = [
            {
                name = "ens3"
                macvtap = "eno1"
                mac = "00:50:56:00:0C:B7"

                additional_routes = [
                    {
                        network = "0.0.0.0/0"
                        gateway = "5.9.32.193"
                    }
                ]

            },
            {
                name = "ens4"
                network_name = "local_net"

                dhcp = false
                ip = "192.168.51.13/24"
                gateway = "192.168.51.1"

                additional_routes = [
                    {
                        network = "192.168.100.128/26"
                        gateway = "192.168.51.1"
                    }
                ]

            },
        ]

        spice_server_enabled = false

        ansible_groups = ["vm", "cloud", "downstream", "public"]
        ansible_user   = "debian"
        ansible_host   = "kel"
    },
    {
        hostname = "hero" # For a group of people I'm working with, https://github.com/queercoded-dev
        domain = "queercoded.dev"

        vcpu = 6
        memory = 32768

        cloudinit_image = "https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2"

        disk_size = 322122547200 # 300 GiB
        
        ssh_keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGSj6rJkx/d2w1c4qagmh7s/TJQHGOAanWprgiHzUKIW"
        ]

        dhcp = true

        network_interfaces = [
            {
                name = "ens3"
                macvtap = "eno1"
                mac = "00:50:56:00:11:07"

                additional_routes = [
                    {
                        network = "0.0.0.0/0"
                        gateway = "5.9.32.193"
                    }
                ]

            },
            {
                name = "ens4"
                network_name = "local_net"

                dhcp = false
                ip = "192.168.51.14/24"
                gateway = "192.168.51.1"

                additional_routes = [
                    {
                        network = "192.168.100.128/26"
                        gateway = "192.168.51.1"
                    }
                ]

            },
        ]

        spice_server_enabled = false

        ansible_groups = ["vm", "cloud", "downstream", "qc"]
        ansible_user   = "debian"
        ansible_host   = "hero"
    }
]
