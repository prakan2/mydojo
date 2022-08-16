# Dojo
## Creating your Testing Environment
- create your testing instance: [here](https://jfrog.com/de/start-free/#saas)
## Preparing your Workbench
- install [JFrog CLI](https://jfrog.com/de/getcli)
- install [IDE Integration](https://www.jfrog.com/confluence/display/JFROG/IDE+Integration)
- install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- install [Docker](https://docs.docker.com/get-docker)
## Configuring your Workbench
- configure JFrog CLI: jf config add | jf config use ([documentation](https://www.jfrog.com/confluence/display/CLI/JFrog+CLI#JFrogCLI-AddingandEditingConfiguredServers))
- configure IDE Plugin: connect to your testing instance ([documentation](https://www.jfrog.com/confluence/display/JFROG/IDE+Integration))
## Working with the CLI
- Read the [manual](https://www.jfrog.com/confluence/display/CLI/CLI+for+JFrog+Artifactory)
- Test it out: [CLI working examples](https://github.com/fjagwitz/mydojo/blob/master/CLI%20usage%20example.sh)
## Aftermath (or Prepwork)
### Understand the concept of Build Promotion
- [Best Practice - Repository Naming Convention](https://jfrog.com/whitepaper/best-practices-structuring-naming-artifactory-repositories/)
- [Best Practice - Build Promotion](https://jfrog.com/knowledge-base/how-does-build-promotion-work/)
### Working with Repositories
#### Remote Repos
- [Unlimited Access to Docker Hub](https://jfrog.com/blog/jfrog-docker-partnership-for-dockerhub/)
#### Virtual Repos
- [Protect against dependency confusion](https://jfrog.com/blog/going-beyond-exclude-patterns-safe-repositories-with-priority-resolution)
### Understand how to integrate Jenkins Pipelines with Artifactory
- [Jenkins Integration](https://jfrog.com/knowledge-base/how-to-build-and-deploy-artifacts-using-jfrog-cli-in-a-jenkins-pipeline)
- [Authentication in Pipelines](https://jfrog.com/knowledge-base/how-to-use-access-tokens-in-your-ci-environment)
### Cool Features
- [Using Webhooks](https://jfrog.com/knowledge-base/artifactory-how-to-test-webhooks-in-artifactory-and-check-its-request-payload)
- [Terraform for Artifactory](https://registry.terraform.io/providers/jfrog/artifactory/latest/docs)
- [Integration in Docker Desktop](https://jfrog.com/blog/get-peace-of-mind-about-security-when-deploying-containers-from-docker-desktop)
### Follow up with Frogbot
- [Github Repo](https://github.com/jfrog/frogbot/blob/master/README.md)
- [Video](https://www.youtube.com/watch?v=dEwxa4cF7BY)
- [Blog](https://jfrog.com/blog/secure-your-git-repository-with-frogbot-the-git-bot)
