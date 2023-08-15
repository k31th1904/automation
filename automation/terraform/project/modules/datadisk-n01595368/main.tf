resource "azurerm_managed_disk" "linuxdisk" {
  count                = length(var.linux_vm_name)
  name                 = "${var.linux_vm_name[count.index]}-datadisk"
  resource_group_name  = var.rg_name
  location             = var.location
  storage_account_type = var.linuxdisk_attributes.storage_account_type
  disk_size_gb         = var.linuxdisk_attributes.disk_size_gb
  create_option        = var.linuxdisk_attributes.create_option
  tags                 = var.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "linuxdisk_attach" {
  count              = length(var.linux_vm_name)
  virtual_machine_id = var.linux_vm_id[count.index]
  managed_disk_id    = azurerm_managed_disk.linuxdisk[count.index].id
  lun                = 0
  caching            = var.linuxdisk_attributes.caching
  depends_on         = [azurerm_managed_disk.linuxdisk]
}
