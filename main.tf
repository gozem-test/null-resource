# Null Resource
resource "null_resource" "callbacks" {
  for_each = { for index, command in var.commands : index => command }

  # Changes to any trigger value will re-run the provisioner
  triggers = {
    timestamp = timestamp()
  }

  provisioner "local-exec" {
    command = each.value
  }
}
