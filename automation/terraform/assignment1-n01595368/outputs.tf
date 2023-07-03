output "rg_name" {
  value = [
    module.rgroup-n01595368.rg_name
  ]
}
output "vnet_name" {
  value = module.network-n01595368.vnet1_name
}
output "vnet1_space" {
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
output "windows_vm_name" {
  value = module.vmwindows-n01595368.windows_vm_name
}
output "windows_vm_fqdn" {
  value = module.vmwindows-n01595368.windows_vm_fqdn
}
output "windows_vm_privateIP" {
  value = module.vmwindows-n01595368.windows_vm_privateIP
}
output "windows_vm_publicIP" {
  value = module.vmwindows-n01595368.windows_vm_publicIP
}
output "windows_avset" {
  value = module.vmwindows-n01595368.windows_avset
}
output "linux_disks_name" {
  value = module.datadisk-n01595368.linuxdisks_name
}
output "windows_disks_name" {
  value = module.datadisk-n01595368.windisks_name
}