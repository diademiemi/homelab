module "vm" {
  source  = "diademiemi/vm/libvirt"
  version = "6.0.1"
  depends_on = [ libvirt_network.local_net ]

  for_each = { for vm in var.vms : vm.name => vm }

    name = each.value.name
    domain = each.value.domain

    password_auth = false
    root_password = ""
    allow_root_ssh_pwauth = false

    vcpu = each.value.vcpu
    memory = each.value.memory

    autostart = each.value.autostart

    cloudinit_image = each.value.cloudinit_image

    disk_size = each.value.disk_size
    libvirt_pool = each.value.libvirt_pool
    disk_passthroughs = coalesce(each.value.disk_passthroughs, [])

    ssh_keys = each.value.ssh_keys

    # libvirt_external_interface = each.value.libvirt_external_interface
    # mac = each.value.mac

    network_interfaces = coalesce(each.value.network_interfaces, [])

    spice_server_enabled = coalesce(each.value.spice_server_enabled, false)

    ansible_host = each.value.ansible_host
    ansible_groups = each.value.ansible_groups
    ansible_user = each.value.ansible_user

}

resource "libvirt_network" "local_net" {
    name      = "local_net"
    mode      = "nat"
    domain    = "blahaj.local"
    addresses = ["192.168.51.0/24"]
    autostart = true
    dhcp {
        enabled = true
    }
}
