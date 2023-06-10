module "vm" {
  source  = "diademiemi/vm/libvirt"
  version = "2.2.0"

  for_each = { for vm in var.vms : vm.hostname => vm }

    hostname = each.value.hostname
    domain = each.value.domain

    vcpu = each.value.vcpu
    memory = each.value.memory

    autostart = each.value.autostart

    cloudinit_image = each.value.cloudinit_image

    disk_size = each.value.disk_size
    libvirt_pool = each.value.libvirt_pool
    disk_passthroughs = coalesce(each.value.disk_passthroughs, [])

    ssh_keys = each.value.ssh_keys

    dhcp = each.value.dhcp
    ip = each.value.ip
    gateway = each.value.gateway

    libvirt_external_interface = each.value.libvirt_external_interface
    mac = each.value.mac

    spice_server_enabled = coalesce(each.value.spice_server_enabled, false)

    ansible_host = each.value.ansible_host
    ansible_groups = each.value.ansible_groups
    ansible_user = each.value.ansible_user

}
