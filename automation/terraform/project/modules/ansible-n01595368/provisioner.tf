resource "null_resource" "ansible_provisioner" {

  provisioner "local-exec" {
    command = "cd ansible && ansible-playbook playbook_n01595368.yml"
  }

}