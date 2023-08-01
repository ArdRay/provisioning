output "proxmox_ip_address_default_nprod" {
    value = proxmox_vm_qemu.rocky9-nprod.*.default_ipv4_address
}

output "proxmox_ip_address_default_runner" {
    value = proxmox_vm_qemu.rocky9-runner.*.default_ipv4_address
}