
# Please change the domain according to what you configured on https://jfrog.com/start-free
variable "artifactory_url" {
  type = string
  default = "https://some.jfrog.io"
}
# Please change the access token according to what you configured in your testplatform
variable "artifactory_access_token" {
  type = string
  default = "cmVmdGtuOjAxOjE2ODk2OTcxMDc6cTM2Q0ZZcTVmRjRXQVN2QnJMN1I5NWdPMlRl"
}
# Please define a password for the non-admin user you will be working with
variable "developer_pw" {
  type = string
  default = "MyV3ry$3cr3tP@$$w0rd"
}