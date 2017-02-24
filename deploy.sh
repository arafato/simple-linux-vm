#!/bin/bash
branch=$(git rev-parse HEAD)
githubUser="arafato"
githubProject="simple-linux-vm"
repoUrl="https://raw.githubusercontent.com/$githubUser/$githubProject/$branch/"
resourceGroupName="playground"
location="North Europe"
azure group create -n "$resourceGroupName" -l "$location"
azure group deployment create --debug-setting All --template-uri "$repoUrl/azuredeploy.json" --parameters "{\"repositoryUrl\":{\"value\":\"$repoUrl\"},\"projectPrefix\":{\"value\":\"arafato\"}}" -g "$resourceGroupName"
