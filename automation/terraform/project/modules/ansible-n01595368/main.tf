resource "local_file" "inventory" {
  filename = "ansible/hosts"
  content  = <<-EOF
    [linux]
    ${join("\n", var.linux_vm_fqdn)}

    [linux:vars]
    ansible_ssh_user = ${var.linux_var.ssh_user}
    ansible_ssh_private_key_file= ${var.linux_var.ssh_privatekey}
    EOF
}


