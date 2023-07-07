resource "azurerm_public_ip" "pip" {
  for_each            = var.linux_name
  name                = "${each.key}-pip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = var.pip_att.allocation_method
  domain_name_label   = each.key
  sku                 = var.pip_att.sku
  tags                = local.common_tags
}

resource "azurerm_network_interface" "nic" {
  for_each            = var.linux_name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.pip[each.key].id
  }
  depends_on = [azurerm_public_ip.pip]
  tags       = local.common_tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each              = var.linux_name
  name                  = each.key
  computer_name         = each.key
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
  size                  = var.vmsize
  admin_username        = var.adminusername

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.disk_attributes.caching
    storage_account_type = var.disk_attributes.type
    disk_size_gb         = var.disk_attributes.size
  }

  admin_ssh_key {
    username   = var.adminusername
    public_key = file(var.publickey)
  }

  source_image_reference {
    publisher = var.OS_attribute.publisher
    offer     = var.OS_attribute.offer
    sku       = var.OS_attribute.sku
    version   = var.OS_attribute.version
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_endpoint
  }
  tags = local.common_tags
}

resource "azurerm_virtual_machine_extension" "extension1" {
  for_each = var.linux_name
  name     = var.extension1.type

  virtual_machine_id         = azurerm_linux_virtual_machine.vm[each.key].id
  publisher                  = var.extension1.publisher
  type                       = var.extension1.type
  type_handler_version       = var.extension1.type_handler_version
  auto_upgrade_minor_version = var.extension1.auto_upgrade_minor_version
  depends_on = [
    azurerm_linux_virtual_machine.vm,
    null_resource.linux_provisioner,
  ]
  tags = local.common_tags
}

resource "azurerm_virtual_machine_extension" "extension2" {
  for_each = var.linux_name
  name     = var.extension2.type

  virtual_machine_id         = azurerm_linux_virtual_machine.vm[each.key].id
  publisher                  = var.extension2.publisher
  type                       = var.extension2.type
  type_handler_version       = var.extension2.type_handler_version
  auto_upgrade_minor_version = var.extension2.auto_upgrade_minor_version
  depends_on = [
    azurerm_linux_virtual_machine.vm,
    null_resource.linux_provisioner,
  ]
  tags = local.common_tags
}


