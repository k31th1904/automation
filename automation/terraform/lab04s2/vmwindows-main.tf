resource "azurerm_public_ip" "winpip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${each.key}-n01595368"
  tags                = local.common_tags


}

resource "azurerm_network_interface" "winnic" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = azurerm_subnet.subnet2.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.winpip[each.key].id
  }
  tags = local.common_tags


}

resource "azurerm_windows_virtual_machine" "winvm" {
  for_each              = var.windows_name
  name                  = each.key
  computer_name         = each.key
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.winnic[each.key].id]
  size                  = each.value
  admin_username        = var.winadminusername
  admin_password        = var.winpassword
  availability_set_id   = azurerm_availability_set.winavset.id
  depends_on            = [azurerm_availability_set.winavset]

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.windisk_attributes.caching
    storage_account_type = var.windisk_attributes.type
    disk_size_gb         = var.windisk_attributes.size
  }


  source_image_reference {
    publisher = var.winOS_attribute.publisher
    offer     = var.winOS_attribute.offer
    sku       = var.winOS_attribute.sku
    version   = var.winOS_attribute.version
  }

  winrm_listener {
    protocol = "Http"
  }
  tags = local.common_tags


}

resource "azurerm_availability_set" "winavset" {
  name                         = var.windows_avs.name
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name
  platform_update_domain_count = var.windows_avs.platform_update_domain_count
  platform_fault_domain_count  = var.windows_avs.platform_fault_domain_count
  tags                         = local.common_tags
}
