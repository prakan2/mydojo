resource "artifactory_group" "dojo-docker-developers" {
  name             = "dojo-docker-developers"
  description      = "dojo docker developers"
  admin_privileges = false
  policy_manager   = true
  watch_manager    = true
  reports_manager  = true
}