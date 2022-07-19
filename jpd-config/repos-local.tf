# team-tech-maturity-locator 
resource "artifactory_local_docker_v2_repository" "dojo-docker-dev-local" {
  key             = "dojo-docker-dev-local"
  repo_layout_ref = "simple-default"
  description     = "A local docker registry for dev containers"
  tag_retention   = 3
  max_unique_tags = 5
  xray_index      = false
}

resource "artifactory_local_docker_v2_repository" "dojo-docker-test-local" {
  key             = "dojo-docker-test-local"
  repo_layout_ref = "simple-default"
  description     = "A local docker registry for test containers"
  tag_retention   = 3
  max_unique_tags = 5
  xray_index      = false
}

resource "artifactory_local_docker_v2_repository" "dojo-docker-qa-local" {
  key             = "dojo-docker-qa-local"
  repo_layout_ref = "simple-default"
  description     = "A local docker registry for qa containers"
  tag_retention   = 3
  max_unique_tags = 5
  xray_index      = false
}

resource "artifactory_local_docker_v2_repository" "dojo-docker-prod-local" {
  key             = "dojo-docker-prod-local"
  repo_layout_ref = "simple-default"
  description     = "A local docker registry for production containers"
  tag_retention   = 3
  max_unique_tags = 5
  xray_index      = true
}

resource "artifactory_local_docker_v2_repository" "dojo-docker-rip-local" {
  key             = "dojo-docker-rip-local"
  repo_layout_ref = "simple-default"
  description     = "A local docker registry for deprecated former production containers"
  tag_retention   = 3
  max_unique_tags = 5
  xray_index      = false
}