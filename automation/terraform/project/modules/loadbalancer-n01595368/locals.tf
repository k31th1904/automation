locals {

  lbrules = {
    http = {
      name                       = "http"
      protocol                   = "Tcp"
      frontend_port              = 80
      backend_port               = 80
      destination_address_prefix = "*"
    }
  }
  lbprobes = {
    http = {
      name = "http-running-probe"
      port = 80
    }
  }
}