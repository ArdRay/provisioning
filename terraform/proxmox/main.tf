provider "proxmox" {
    pm_api_url = var.proxmox_api_url
    pm_api_token_id = var.proxmox_api_token_id
    pm_api_token_secret = var.proxmox_api_token_secret
    pm_tls_insecure = false
}

resource "proxmox_vm_qemu" "rocky9-nprod" {
    count = 4
    name = "vmk-nprod-0${count.index + 1}"
    vmid = "12${count.index + 1}"
    target_node = var.proxmox_node
    clone = var.template_name
    full_clone = true

    agent = 1
    os_type = "centos"
    cores = 6
    sockets = 1
    cpu = "host"
    memory = 16384
    scsihw = "virtio-scsi-pci"
    bootdisk = "scsi0"
    
    disk {
        slot = 0
        size = "32G"
        type = "scsi"
        storage = "local-lvm"
    }
  
    network {
        model = "virtio"
        bridge = "vmbr0"
        firewall = true
    }

    lifecycle {
        ignore_changes = [
            network,
        ]
    }

    tags = "production"

}

resource "proxmox_vm_qemu" "rocky9-runner" {
    count = 1
    name = "vmk-run-0${count.index + 1}"
    vmid = "13${count.index + 1}"
    target_node = var.proxmox_node
    clone = var.template_name
    full_clone = true

    agent = 1
    os_type = "centos"
    cores = 2
    sockets = 1
    cpu = "host"
    memory = 8192
    scsihw = "virtio-scsi-pci"
    bootdisk = "scsi0"
    
    disk {
        slot = 0
        size = "32G"
        type = "scsi"
        storage = "local-lvm"
    }
  
    network {
        model = "virtio"
        bridge = "vmbr0"
        firewall = true
    }

    lifecycle {
        ignore_changes = [
            network,
        ]
    }

    tags = "cicd-runner"

}
