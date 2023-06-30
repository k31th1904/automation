variable "rg" {}
variable "location" {}
variable "subnet_id" {}
variable "vmname" {}
variable "vmsize" {}
variable "adminusername" {
  default = "n01595368"
}
variable "publickey" {
  default = "~/.ssh/id_rsa.pub"
}
variable "privatekey" {
  default = "~/.ssh/id_rsa"
}
variable "disk_attributes" {
  type = map(any)
  default = {
    type    = "Premium_LRS"
    size    = 32
    caching = "ReadWrite"
  }
}
variable "OS_attribute" {
  type = map(any)
  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
variable "linux_avs_att" {
  type = map(any)
  default = {
    platform_update_domain_count = "5"
    platform_fault_domain_count  = "2"
  }
}
variable "linux_avs_name" {}
variable "nb_count" {}
locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Linux"
    ContactEmail = "n01595368@humber.ca"
    Environment  = "Lab"
  }
}
