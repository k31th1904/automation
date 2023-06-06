output "VM_name" {
  value = [azurerm_linux_virtual_machine.vm[*].name]
}
output "VM_fqdn" {
  value = [azurerm_public_ip.pip[*].fqdn]
}
output "VM_PrivateIP" {
  value = [azurerm_linux_virtual_machine.vm[*].private_ip_address]
}
output "VM_PublicIP" {
  value = [azurerm_linux_virtual_machine.vm[*].public_ip_address]
}
output "VNET_Name" {
  value = azurerm_virtual_network.vnet.name
}
output "VNET_Space" {
  value = azurerm_virtual_network.vnet.address_space
}
output "Subnet1_Name" {
  value = azurerm_subnet.subnet.name
}
output "Subnet1_Space" {
  value = azurerm_subnet.subnet.address_prefixes[0]
}
output "Subnet2_Name" {
  value = azurerm_subnet.subnet2.name
}
output "Subnet2_Space" {
  value = azurerm_subnet.subnet2.address_prefixes[0]
}
output "Linux_Avset" {
  value = azurerm_availability_set.avset.name
}
