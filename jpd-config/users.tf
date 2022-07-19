resource "artifactory_user" "dojo-developer" {
  name     = "dojodev"
  email    = "dojodev@fritzdata.de"
  password = var.developer_pw
  disable_ui_access = false
  groups   = ["${artifactory_group.dojo-docker-developers.name}"]
}