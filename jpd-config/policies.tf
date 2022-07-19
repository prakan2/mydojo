resource "xray_security_policy" "dojo-docker-curation" {
  name        = "dojo-docker-curation"
  description = "Dojo Curation Policy for Docker Containers"
  type        = "security"

  rule {
    name     = "filter"
    priority = 1

    criteria {

      cvss_range {
        from = 9.9
        to   = 10.0
      }
    }

    actions {
      webhooks = []
      mails    = ["fvj@jfrog.com"]
      block_release_bundle_distribution  = true
      fail_build                         = true
      notify_watch_recipients            = false
      notify_deployer                    = false
      create_ticket_enabled              = false // set to true only if Jira integration is enabled
      build_failure_grace_period_in_days = 0     // use only if fail_build is enabled

      block_download {
        unscanned = false
        active    = false
      }
    }
  }

  rule {
    name     = "warn"
    priority = 2

    criteria {

      cvss_range {
        from = 6.9
        to   = 9.8
      }
    }

    actions {
      webhooks = []
      mails    = ["fvj@jfrog.com"]
      block_release_bundle_distribution  = false
      fail_build                         = true
      notify_watch_recipients            = false
      notify_deployer                    = false
      create_ticket_enabled              = false // set to true only if Jira integration is enabled
      build_failure_grace_period_in_days = 30    // use only if fail_build is enabled

      block_download {
        unscanned = false
        active    = false
      }
    }
  }
  rule {
    name     = "ignore"
    priority = 3

    criteria {

      cvss_range {
        from = 2.9
        to   = 6.8
      }
    }

    actions {
      webhooks = []
      mails    = ["fvj@jfrog.com"]
      block_release_bundle_distribution  = false
      fail_build                         = false
      notify_watch_recipients            = false
      notify_deployer                    = false
      create_ticket_enabled              = false // set to true only if Jira integration is enabled

      block_download {
        unscanned = false
        active    = false
      }
    }
  }  
}

resource "xray_security_policy" "dojo-docker-prod" {
  name        = "dojo-docker-prod"
  description = "Dojo Monitoring Policy for Docker Containers"
  type        = "security"

  rule {
    name     = "filter"
    priority = 1

    criteria {

      cvss_range {
        from = 9.0
        to   = 10.0
      }
    }

    actions {
      webhooks = []
      mails    = ["fvj@jfrog.com"]
      block_release_bundle_distribution  = true
      fail_build                         = true
      notify_watch_recipients            = true
      notify_deployer                    = true
      create_ticket_enabled              = false // set to true only if Jira integration is enabled
      build_failure_grace_period_in_days = 0     // use only if fail_build is enabled

      block_download {
        unscanned = true
        active    = true
      }
    }
  }

  rule {
    name     = "warn"
    priority = 2

    criteria {

      cvss_range {
        from = 6.9
        to   = 8.9
      }
    }

    actions {
      webhooks = []
      mails    = ["fvj@jfrog.com"]
      block_release_bundle_distribution  = false
      fail_build                         = true
      notify_watch_recipients            = false
      notify_deployer                    = false
      create_ticket_enabled              = false // set to true only if Jira integration is enabled
      build_failure_grace_period_in_days = 30    // use only if fail_build is enabled

      block_download {
        unscanned = false
        active    = false
      }
    }
  }
  rule {
    name     = "ignore"
    priority = 3

    criteria {

      cvss_range {
        from = 2.9
        to   = 6.8
      }
    }

    actions {
      webhooks = []
      mails    = ["fvj@jfrog.com"]
      block_release_bundle_distribution  = false
      fail_build                         = false
      notify_watch_recipients            = false
      notify_deployer                    = false
      create_ticket_enabled              = false // set to true only if Jira integration is enabled

      block_download {
        unscanned = false
        active    = false
      }
    }
  }  
}