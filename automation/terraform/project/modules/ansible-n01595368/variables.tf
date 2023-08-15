variable "linux_vm_fqdn" {}

variable "linux_var" {
  default = {
    ssh_user       = "n01595368"
    ssh_privatekey = "~/.ssh/id_rsa"
  }
}