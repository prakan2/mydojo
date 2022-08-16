resource "artifactory_user" "dojo-developer" {
  name     = "dojodev"
  email    = var.email_address
  password = var.developer_pw
  disable_ui_access = false
  groups   = ["${artifactory_group.dojo-docker-developers.name}"]
}