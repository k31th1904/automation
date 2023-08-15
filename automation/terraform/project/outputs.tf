output "rg_name" {
  value = [
    module.rgroup-n01595368.rg_name
  ]
}
output "vnet_name" {
  value = module.network-n01595368.vnet1_name
}
output "vnet_space" {
  value = module.network-n01595368.vnet1_space[0]
}
output "subnet1_name" {
  value = module.network-n01595368.subnet1_name
}
output "subnet1_space" {
  value = module.network-n01595368.subnet1_space[0]
}
output "nsg1_name" {
  value = module.network-n01595368.nsg1_name
}
output "storage_name" {
  value = module.common-n01595368.storage_name
}
output "workspace_name" {
  value = module.common-n01595368.workspace_name
}
output "vault_name" {
  value = module.common-n01595368.vault_name
}
output "linux_vm_name" {
  value = module.vmlinux-n01595368.linux_vm_name
}
output "linux_vm_fqdn" {
  value = module.vmlinux-n01595368.linux_vm_fqdn
}
output "linux_vm_privateIP" {
  value = module.vmlinux-n01595368.linux_vm_privateIP
}
output "linux_vm_publicIP" {
  value = module.vmlinux-n01595368.linux_vm_publicIP
}

output "linux_datadisks_name" {
  value = module.datadisk-n01595368.linuxdisks_name
}

output "linux_loadbalancer_fqdn" {
  value = module.loadbalancer-n01595368.lbpip_fqdn
}

output "linux_loadbalancer_publicIP" {
  value = module.loadbalancer-n01595368.lbpip_public_ip
}

output "loadbalancer_name" {
  value = module.loadbalancer-n01595368.lb_name
}
output "dbserver_name" {
  value     = module.database-n01595368.dbserver_name
  sensitive = true
}
output "db_name" {
  value = module.database-n01595368.db_name
}
