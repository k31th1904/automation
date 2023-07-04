resource "null_resource" "linux_provisioner" {
  for_each   = var.linux_name
  depends_on = [azurerm_linux_virtual_machine.vm]

  provisioner "remote-exec" {
    inline = [
      # Install nginx here to test load balancing via http 80
      "sudo yum install -y nginx",   # Install nginx
      "sudo systemctl start nginx",  # Start nginx service
      "sudo systemctl enable nginx", # Enable nginx to start at boot
    ]

    connection {
      type        = "ssh"
      user        = var.adminusername
      private_key = file(var.privatekey)
      host        = azurerm_public_ip.pip[each.key].fqdn
    }

  }
  provisioner "remote-exec" {
    inline = [
      "/bin/hostname" # Get hostname for the VM
    ]

    connection {
      type        = "ssh"
      user        = var.adminusername
      private_key = file(var.privatekey)
      host        = azurerm_public_ip.pip[each.key].fqdn
    }

  }
}