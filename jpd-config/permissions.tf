resource "artifactory_permission_target" "dojo-docker-development" {
  name = "dojo-docker-development"

  repo {
    repositories    = ["dojo-docker-dev-local","dojo-docker-test-local","dojo-docker-qa-local","dojo-docker-prod-local","dojo-docker-rip-local","dojo-docker-dockerhub","dojo-docker-jfrog"]
    
    actions {
      groups {
        name        = "${artifactory_group.dojo-docker-developers.name}"
        permissions = ["read","write","annotate","delete","manage","managedXrayMeta"]
      }
    }
  }

  build {
    includes_pattern = ["dojo*/**"]
    repositories     = ["artifactory-build-info"]

    actions {
      groups {
        name        = "${artifactory_group.dojo-docker-developers.name}"
        permissions = ["read","write","annotate","delete","manage","managedXrayMeta"]
      }
    }
  }
}

