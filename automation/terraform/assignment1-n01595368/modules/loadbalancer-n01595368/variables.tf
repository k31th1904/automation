variable "rg_name" {}
variable "location" {}
variable "pip_name" {}
variable "lbpip_att" {
  type = map(any)
  default = {
    sku               = "Standard"
    allocation_method = "Static"
  }
}
variable "lb_name" {}
variable "pool_name" {}
variable "nic_ids" {}
variable "ipconfigs" {}
variable "lb_sku" {
  default = "Standard"
}

variable "diagnostic_name" {}
variable "workspace_id" {}