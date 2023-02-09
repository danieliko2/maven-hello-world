#!/bin/bash
VERSION=${{ env.POM_VERSION }}
NEXTVERSION=$(echo ${VERSION} | awk -F. -v OFS=. '{$NF += 1 ; print}')
${{ env.POM_VERSION=$NEXTVERSION}}
echo "$NEXTVERSION"