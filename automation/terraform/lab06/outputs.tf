output "RG_NAME" {
  value = [
    module.resource_group.network_rg_name,
    module.resource_group.linux_rg_name,
    module.resource_group.windows_rg_name
  ]
}
output "VNET_Name" {
  value = module.network.VNET_Name
}
output "VNET_Space" {
  value = module.network.VNET_Space[0]
}
output "Subnet1_Name" {
  value = module.network.Subnet1_Name
}
output "Subnet1_Space" {
  value = module.network.Subnet1_Space[0]
}
output "NSG1" {
  value = module.network.NSG1_Name
}
output "Subnet2_Name" {
  value = module.network.Subnet2_Name
}
output "Subnet2_Space" {
  value = module.network.Subnet2_Space[0]
}
output "NSG2" {
  value = module.network.NSG2_Name
}
output "Linux_VM_name" {
  value = module.linux.VM_name
}
output "Linux_VM_fqdn" {
  value = module.linux.VM_fqdn
}
output "Linux_VM_PrivateIP" {
  value = module.linux.VM_PrivateIP
}
output "Linux_VM_PublicIP" {
  value = module.linux.VM_PublicIP
}
output "Linux_avs_set" {
  value = module.linux.Linux_avs_set
}
output "Windows_VM_name" {
  value = module.windows.Windows_VM_name
}
output "Windows_VM_fqdn" {
  value = module.windows.Windows_VM_fqdn
}
output "Windows_VM_PrivateIP" {
  value = module.windows.Windows_VM_PrivateIP
}
output "Windows_VM_PublicIP" {
  value = module.windows.Windows_VM_PublicIP
}
output "Windows_Avset" {
  value = module.windows.Windows_Avset
}
