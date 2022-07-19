# team-tech-maturity-locator 
resource "artifactory_virtual_docker_repository" "dojo-dev-docker" {
  key                 = "dojo-dev-docker"
  repositories        = ["dojo-docker-dev-local","dojo-docker-dockerhub","dojo-docker-jfrog"]
  description         = "Dojo DEV container registry"
  notes               = "Created for a specific session"
  includes_pattern    = ""
  excludes_pattern    = ""
  default_deployment_repo = "dojo-docker-dev-local"
  depends_on = [
    artifactory_local_docker_v2_repository.dojo-docker-dev-local, 
    artifactory_remote_docker_repository.dojo-docker-dockerhub,
    artifactory_remote_docker_repository.dojo-docker-jfrog
  ]
}

resource "artifactory_virtual_docker_repository" "dojo-test-docker" {
  key                 = "dojo-test-docker"
  repositories        = ["dojo-docker-dev-local","dojo-docker-test-local"]
  description         = "Dojo TEST container registry"
  notes               = "Created for a specific session"
  includes_pattern    = ""
  excludes_pattern    = ""
  default_deployment_repo = "dojo-docker-test-local"
  depends_on = [
    artifactory_local_docker_v2_repository.dojo-docker-dev-local,
    artifactory_local_docker_v2_repository.dojo-docker-test-local
  ]
}

resource "artifactory_virtual_docker_repository" "dojo-qa-docker" {
  key                 = "dojo-qa-docker"
  repositories        = ["dojo-docker-test-local","dojo-docker-qa-local"]
  description         = "Dojo QA container registry"
  notes               = "Created for a specific session"
  includes_pattern    = ""
  excludes_pattern    = ""
  default_deployment_repo = "dojo-docker-qa-local"
  depends_on = [
    artifactory_local_docker_v2_repository.dojo-docker-test-local,
    artifactory_local_docker_v2_repository.dojo-docker-qa-local
  ]
}

resource "artifactory_virtual_docker_repository" "dojo-prod-docker" {
  key                 = "dojo-prod-docker"
  repositories        = ["dojo-docker-qa-local","dojo-docker-prod-local"]
  description         = "Dojo container registry for production containers"
  notes               = "Created for a specific session"
  includes_pattern    = ""
  excludes_pattern    = ""
  default_deployment_repo = "dojo-docker-prod-local"
  depends_on = [
    artifactory_local_docker_v2_repository.dojo-docker-qa-local,
    artifactory_local_docker_v2_repository.dojo-docker-prod-local
  ]
}

resource "artifactory_virtual_docker_repository" "dojo-rip-docker" {
  key                 = "dojo-rip-docker"
  repositories        = ["dojo-docker-prod-local","dojo-docker-rip-local"]
  description         = "Dojo container registry for deprecated containers"
  notes               = "Created for a specific session"
  includes_pattern    = ""
  excludes_pattern    = ""
  default_deployment_repo = "dojo-docker-rip-local"
  depends_on = [
    artifactory_local_docker_v2_repository.dojo-docker-prod-local,
    artifactory_local_docker_v2_repository.dojo-docker-rip-local
  ]
}