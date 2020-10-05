#!/bin/bash
sudo yum -y install java-1.8.0-openjdk  java-1.8.0-openjdk-devel
sudo java -version
sudo export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.265.b01-1.amzn2.0.1.x86_64
sudo export PATH=$PATH:$JAVA_HOME/bin
sudo curl -sL https://bintray.com/jfrog/artifactory-rpms/rpm | sudo tee /etc/yum.repos.d/bintray-jfrog-artifactory-rpms.repo
sudo yum -y install jfrog-artifactory-cpp-ce wget
sudo echo "export ARTIFACTORY_HOME=/opt/jfrog/artifactory" | sudo tee -a /etc/profile
sudo source /etc/profile
sudo env | grep ARTIFACTORY_HOME
sudo systemctl start artifactory.service
sudo systemctl status artifactory.service
