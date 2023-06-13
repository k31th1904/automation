resource "azurerm_public_ip" "pip" {
  count               = var.nb_count
  name                = "${var.vmname}-pip-${format("%1d", count.index + 1)}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.vmname}-n01595368-${format("%1d", count.index + 1)}"
  tags                = local.common_tags


}

resource "azurerm_network_interface" "nic" {
  count               = var.nb_count
  name                = "${var.vmname}-nic-${format("%1d", count.index + 1)}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "${var.vmname}-ipconfig-${format("%1d", count.index + 1)}"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.pip[*].id, count.index + 1)
  }
  tags = local.common_tags



}

resource "azurerm_linux_virtual_machine" "vm" {
  count                 = var.nb_count
  name                  = "${var.vmname}${format("%1d", count.index + 1)}"
  computer_name         = "${var.vmname}${format("%1d", count.index + 1)}"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [element(azurerm_network_interface.nic[*].id, count.index + 1)]
  size                  = var.vmsize
  admin_username        = var.adminusername
  availability_set_id   = azurerm_availability_set.avset.id
  depends_on            = [azurerm_availability_set.avset]

  os_disk {
    name                 = "${var.vmname}-os-disk${format("%1d", count.index + 1)}"
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

  tags = local.common_tags


}

resource "azurerm_availability_set" "avset" {
  name                         = var.linux_avs.name
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name
  platform_update_domain_count = var.linux_avs.platform_update_domain_count
  platform_fault_domain_count  = var.linux_avs.platform_fault_domain_count
  tags                         = local.common_tags
}

