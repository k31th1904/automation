locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "hooyin.kwok"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
    Category       = "LoadBalancer"
  }
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