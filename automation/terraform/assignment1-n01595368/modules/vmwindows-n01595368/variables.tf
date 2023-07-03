variable "rg_name" {}
variable "location" {}
variable "subnet_id" {}
variable "storage_account_endpoint" {}
variable "nb_count" {}
variable "vmname" {}
variable "vmsize" {
  default = "Standard_B1ms"
}
variable "winadminusername" {
  default = "n01595368"
}
variable "winpassword" {
  default = "n01595368!"
}
variable "windisk_attributes" {
  type = map(any)
  default = {
    type    = "StandardSSD_LRS"
    size    = 128
    caching = "ReadWrite"
  }
}
variable "winOS_attribute" {
  type = map(any)
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
variable "windows_avs_name" {}
variable "windows_avs_att" {
  type = map(any)
  default = {
    platform_update_domain_count = "5"
    platform_fault_domain_count  = "2"
  }
}
variable "extension1" {
  type = map(any)
  default = {
    publisher                  = "Microsoft.Azure.Security"
    type                       = "IaaSAntimalware"
    type_handler_version       = "1.3"
    auto_upgrade_minor_version = "true"
  }
}
locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "hooyin.kwok"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
    Category       = "Windows VM"
  }
}