resource "resource_group" {
  source     = "./modules/resource_group"
  network_rg = "Network-RG"
  linux_rg   = "Linux-RG"
  windows_rg = "Windows-RG"
  location   = "Canada East"
}