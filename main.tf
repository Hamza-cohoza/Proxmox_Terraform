resource "proxmox_lxc" "basic" {
//nbr CT
   count=1
   
  target_node  = "pve"
  hostname     = "CTlo${count.index}"
  
  ostemplate   = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
  password     = ""
  unprivileged = true

  
  rootfs {
    storage = "local"
    size    = "2G"
  }
  network {
    name   = "eth"
    bridge = "vmbr"
    ip     = "dhcp" 
    }
}
