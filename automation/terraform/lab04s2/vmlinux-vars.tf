variable "vmname" {
  default = "n01595368-u-vm"
}

variable "vmsize" {
  default = "Standard_B1s"
}

variable "adminusername" {
  default = "n01595368"
}

variable "publickey" {
  default = "~/.ssh/id_rsa.pub"
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

variable "linux_avs" {
  type = map(any)
  default = {
    name                         = "linux_avset"
    platform_update_domain_count = "5"
    platform_fault_domain_count  = "2"
  }
}

variable "nb_count" {
  default = "2"
}

locals {
  common_tags = {
    Name         = "Terraform-Classb"
    Project      = "Learning"
    ContactEmail = "n01595368@humber.ca"
    Environment  = "Lab"
  }
}
