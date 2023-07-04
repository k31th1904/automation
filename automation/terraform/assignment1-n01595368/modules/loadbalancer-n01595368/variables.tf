variable "rg_name" {}
variable "location" {}
variable "pip_name" {}
variable "lbpip_sku" {
  default = "Standard"
}
variable "lb_name" {}
variable "pool_name" {}
variable "nic_ids" {}
variable "ipconfigs" {}
variable "lb_sku" {
  default = "Standard"
}
