variable "rg_name" {}
variable "location" {}
variable "linux_vm_name" {}
variable "linux_vm_id" {}
variable "linuxdisk_attributes" {
  type = map(any)
  default = {
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 10
    create_option        = "Empty"
    caching              = "ReadWrite"
  }
}
variable "windows_vm_name" {}
variable "windows_vm_id" {}
variable "windisk_attributes" {
  type = map(any)
  default = {
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 10
    create_option        = "Empty"
    caching              = "ReadWrite"
  }
}
locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "hooyin.kwok"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
    Category       = "DataDisk"
  }
}