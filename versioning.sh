#!/bin/bash
VERSION=$(curl -s https://registry.hub.docker.com/v2/repositories/danieliko/maven-hw-testings/tags/ | jq '.results[0].name') # get the latest version from my repository
VERSION=$(python3 -c " 
VERSION=$VERSION.replace('\"', '') 
print(VERSION) ") # use python to remove double quotes from version
echo $VERSION
NEXTVERSION=$(echo ${VERSION} | awk -F. -v OFS=. '{$NF += 1 ; print}')
echo "$NEXTVERSION" > ./myapp/.version

#VERSION=$(mvn org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate -Dexpression=project.version | grep -Ev '(^\[|Download\w+:)') get version from 
