#!/bin/bash
cd myapp
VERSION=$(mvn org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate -Dexpression=project.version | grep -Ev '(^\[|Download\w+:)')
NEXTVERSION=$(echo ${VERSION} | awk -F. -v OFS=. '{$NF += 1 ; print}')
echo $NEXTVERSION > version
mvn versions:set -DnewVersion=$NEXTVERSION