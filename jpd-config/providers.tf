terraform {
  required_providers {
    artifactory = {
      source = "jfrog/artifactory"
      version = "6.11.0"
    }
    xray = {
      source = "jfrog/xray"
      version = "1.2.1"
    }
  }
}

provider "artifactory" {
  # Configuration options
  url           = "${var.artifactory_url}/artifactory"
  access_token  = "${var.artifactory_access_token}"
}

provider "xray" {
  # Configuration options
  url           = "${var.artifactory_url}/xray"
  access_token  = "${var.artifactory_access_token}"
}