output "proxmox_ip_address_default" {
    value = proxmox_vm_qemu.rocky9-cicdt.*.default_ipv4_address
}