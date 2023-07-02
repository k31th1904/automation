resource "null_resource" "linux_provisioner" {
  for_each   = var.linux_name
  depends_on = [azurerm_linux_virtual_machine.vm]

  provisioner "remote-exec" {
    inline = [
      "/bin/hostname"
    ]

    connection {
      type        = "ssh"
      user        = var.adminusername
      private_key = file(var.privatekey)
      host        = azurerm_public_ip.pip[each.key].fqdn
    }

  }
}