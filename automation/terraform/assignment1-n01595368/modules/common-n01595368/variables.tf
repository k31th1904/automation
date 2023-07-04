variable "rg_name" {}

variable "location" {}

variable "storage_name" {}
variable "storage_att" {
  type = map(any)
  default = {
    tier        = "Standard"
    replication = "LRS"
  }
}

variable "workspace_name" {}
variable "workspace_att" {
  type = map(any)
  default = {
    sku       = "PerGB2018"
    retention = "30"
  }
}

variable "vault_name" {}
variable "vault_att" {
  type = map(any)
  default = {
    sku = "Standard"
  }
}
