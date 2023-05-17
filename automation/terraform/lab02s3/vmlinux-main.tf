resource "azurerm_public_ip" "pip" {
  name                = "${var.vmname}-pip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.vmname}-n01595368"
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.vmname}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "${var.vmname}-ipconfig"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.vmname
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = var.vmsize
  admin_username        = var.adminusername

  os_disk {
    name                 = "${var.vmname}-os-disk"
    caching              = var.disk_caching
    storage_account_type = var.disk_acc_type
    disk_size_gb         = var.disk_size
  }

  admin_ssh_key {
    username   = var.adminusername
    public_key = file(var.publickey)
  }

  source_image_reference {
    publisher = var.OS_publisher
    offer     = var.OS_offer
    sku       = var.OS_sku
    version   = var.OS_version
  }
}
