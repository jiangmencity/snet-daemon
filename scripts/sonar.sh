#!/bin/bash

set -ex

PARENT_PATH=$(dirname $(cd $(dirname $0); pwd -P))

pushd $PARENT_PATH
sudo apt install unzip -y
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip
unzip sonar-scanner-cli-4.6.2.2472-linux.zip

export SONAR_SCANNER_OPTS="-Xmx2048m"
sonar-scanner-4.6.2.2472-linux/bin/sonar-scanner -Dsonar.host.url=https://sonarqube.singularitynet.io -Dsonar.login=${SONAR_TOKEN} $SONAR_SCANNER_OPTS_CUSTOM
popd