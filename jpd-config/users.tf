resource "artifactory_user" "dojo-developer" {
  name     = "coderking"
  email    = "coderking@fritzdata.de"
  password = var.developer_pw
  disable_ui_access = false
  groups   = ["${artifactory_group.dojo-docker-developers.name}"]
}