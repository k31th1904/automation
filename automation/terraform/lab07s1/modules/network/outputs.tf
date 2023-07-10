output "VNET_Name" {
  value = azurerm_virtual_network.vnet.name
}
output "VNET_Space" {
  value = azurerm_virtual_network.vnet.address_space
}
output "Subnet1_Name" {
  value = azurerm_subnet.subnet1.name
}
output "Subnet1_Space" {
  value = azurerm_subnet.subnet1.address_prefixes
}
output "Subnet1_ID" {
  value = azurerm_subnet.subnet1.id
}
output "Subnet2_Name" {
  value = azurerm_subnet.subnet2.name
}
output "Subnet2_Space" {
  value = azurerm_subnet.subnet2.address_prefixes
}
output "Subnet2_ID" {
  value = azurerm_subnet.subnet2.id
}
output "NSG1_Name" {
  value = azurerm_network_security_group.nsg1.name
}
output "NSG2_Name" {
  value = azurerm_network_security_group.nsg2.name
}
