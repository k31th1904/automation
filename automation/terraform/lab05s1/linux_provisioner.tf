resource "null_resource" "linux_provisioner" {
  count      = var.nb_count
  depends_on = [azurerm_linux_virtual_machine.vm]

  provisioner "remote-exec" {
    inline = [
      "/bin/hostname"
    ]

    connection {
      type        = "ssh"
      user        = var.adminusername
      private_key = file(var.privatekey)
      host        = element(azurerm_public_ip.pip[*].fqdn, count.index + 1)
    }

  }
}