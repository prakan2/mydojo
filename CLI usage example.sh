export CLIUSER=$(cat ./jpd-config/users.tf | grep dojo-developer -A2 | grep name | awk -F\" '{print $2}')
export CLICRED=$(cat ./jpd-config/credentials.tf | grep developer_pw -A2 | grep default | awk -F\" '{print $2}')

export CLICONF='jfrog-cli'
export DOCKERCONF='~/.docker/config.json'
export CI=true
export DEPS='./mvn-app/'
export JPD='http://ec2-18-218-116-112.us-east-2.compute.amazonaws.com:8082/'
export PRJ='nishup/keycloak'
export SRCCTR='bitnami/keycloak'

export JFROG_CLI_ENV_EXCLUDE="CLICRED;PATH;VSCODE*;*ASKPASS;*EXCLUDE"
export JFROG_CLI_BUILD_NAME="nishup-docker"
export JFROG_CLI_BUILD_NUMBER="1"
export DOCKERTAG='1'

export DEVREPO="nishup-dev-docker"
export TESTREPO="nishup-test-docker"
export QAREPO="nishup-qa-docker"
export PRODREPO="nishup-prod-docker"
export RIPREPO="nishup-rip-docker"

jf config add $CLICONF \
--url https://$JPD \
--user $CLIUSER \
--password $CLICRED \
--overwrite=true

jf config use $CLICONF

jf docker pull $JPD/$DEVREPO/$SRCCTR:$DOCKERTAG
jf docker tag $JPD/$DEVREPO/$SRCCTR:$DOCKERTAG $JPD/$DEVREPO/$PRJ:$JFROG_CLI_BUILD_NUMBER
jf docker push $JPD/$DEVREPO/$PRJ:$JFROG_CLI_BUILD_NUMBER --build-name=$JFROG_CLI_BUILD_NAME --build-number=$JFROG_CLI_BUILD_NUMBER

jf rt build-add-dependencies $JFROG_CLI_BUILD_NAME $JFROG_CLI_BUILD_NUMBER $DEPS
jf rt build-add-git $JFROG_CLI_BUILD_NAME $JFROG_CLI_BUILD_NUMBER
jf rt build-collect-env $JFROG_CLI_BUILD_NAME $JFROG_CLI_BUILD_NUMBER
jf rt build-publish $JFROG_CLI_BUILD_NAME $JFROG_CLI_BUILD_NUMBER

jf rt build-promote $JFROG_CLI_BUILD_NAME $JFROG_CLI_BUILD_NUMBER $TESTREPO --status TEST --comment "unit tests successul"

jf docker scan $JPD/$DEVREPO/$PRJ:$JFROG_CLI_BUILD_NUMBER --format=json
jf docker scan $JPD/$DEVREPO/$PRJ:$JFROG_CLI_BUILD_NUMBER

jf rt build-promote $JFROG_CLI_BUILD_NAME $JFROG_CLI_BUILD_NUMBER $QAREPO --status QA --comment "security checks successful"

jf build-scan $JFROG_CLI_BUILD_NAME $JFROG_CLI_BUILD_NUMBER --format=json
jf build-scan $JFROG_CLI_BUILD_NAME $JFROG_CLI_BUILD_NUMBER

jf rt build-promote $JFROG_CLI_BUILD_NAME $JFROG_CLI_BUILD_NUMBER $PRODREPO --status PROD --comment "currently in production"

jf rt build-promote $JFROG_CLI_BUILD_NAME $JFROG_CLI_BUILD_NUMBER $RIPREPO --status DEPRECATED --comment "archived for forensics"

jf config remove $CLICONF

rm $DOCKERCONF

unset CLIUSER
unset CLICRED

echo "[INFO] Done!"

exit
