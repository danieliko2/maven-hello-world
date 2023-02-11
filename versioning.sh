#!/bin/bash
# VERSION=$(curl -s https://registry.hub.docker.com/v2/repositories/danieliko/maven-hw-testings/tags/ | jq '.results[0].name') # get the latest version from my repository
# VERSION=$(python3 -c " 
# VERSION=$VERSION.replace('\"', '') 
# print(VERSION) ") # use python to remove double quotes from version
# # echo $VERSION
# NEXTVERSION=$(echo ${VERSION} | awk -F. -v OFS=. '{$NF += 1 ; print}')
# export NEXTVERSION="$NEXTVERSION"

# echo "$NEXTVERSION"
# get last version from Dockerhub
VERSION=$(curl -s https://registry.hub.docker.com/v2/repositories/danieliko/maven-hw-testings/tags/ | jq '.results[0].name') || VERSION=1.0.0

echo $VERSION
# if it's first build, set version to 1.0.0 (after incrementing by 0.0.1)
if [[ "$VERSION" == null ]]; then
    VERSION=1.0.-1
else
    # VERSION=1.023
VERSION=$(python3 -c " 
VERSION=$VERSION.replace('\"', '') 
print(VERSION) ")
fi

echo $VERSION