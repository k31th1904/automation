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

variable "windows_avs" {
  type = map(any)
  default = {
    name                         = "windows_avset"
    platform_update_domain_count = "5"
    platform_fault_domain_count  = "2"
  }
}

variable "windows_name" {
  type = map(any)
  default = {
    n01595368-w-vm1 = "Standard_B1s"
    n01595368-w-vm2 = "Standard_B1ms"
  }
}