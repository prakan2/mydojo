resource "xray_watch" "dojo-docker-remote" {
  name        = "dojo-docker-remote"
  description = "dojo-docker-remote"
  active      = true

  watch_resource {
    type       = "repository"
    bin_mgr_id = "default"
    name       = "${artifactory_remote_docker_repository.dojo-docker-dockerhub.key}"
    repo_type  = "remote"

    filter {
      type  = "regex"
      value = ".*"
    }
  }

  assigned_policy {
    name = "${xray_security_policy.dojo-docker-curation.name}"
    type = "security"
  }

  watch_recipients = [var.email_address]
}

resource "xray_watch" "dojo-docker-prod" {
  name        = "dojo-docker-prod"
  description = "Monitor the production repo of the Dojo project"
  active      = true

  watch_resource {
    type       = "repository"
    bin_mgr_id = "default"
    name       = "${artifactory_local_docker_v2_repository.dojo-docker-prod-local.key}"
    repo_type  = "local"

    filter {
      type  = "regex"
      value = ".*"
    }
  }

  assigned_policy {
    name = "${xray_security_policy.dojo-docker-prod.name}"
    type = "security"
  }

  watch_recipients = [var.email_address]
}