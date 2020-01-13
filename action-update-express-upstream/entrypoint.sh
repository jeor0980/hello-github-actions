#!/bin/bash

  git config --global user.email "osr_web_deploy@colorado.edu"
  git config --global user.name "osrwebdeploy"

  TESTING_PREFIX = "8-actions-test-"
  UPSTREAM_NAME = $TESTING_PREFIX += $EXPRESS_VERSION

echo Printing global variables...
echo $GITHUB_REF
echo $GITHUB_SHA
echo Start script...
echo Cloning express-mono-upstream
git clone https://osrwebdeploy:$TOKEN@github.com/CuBoulder/express-mono-upstream.git
cd express-mono-upstream
echo checking out $UPSTREAM_NAME
git checkout -b $UPSTREAM_NAME
ls -al
cd profiles
rm -rf express
echo Cloning express_mono
git clone https://osrwebdeploy:$TOKEN@github.com/CuBoulder/express_mono.git express
cd express
git checkout $EXPRESS_VERSION
cd ..
git add express
git commit -m "Updating express_mono to $EXPRESS_VERSION"
echo Pushing changes...
git push --set-upstream origin $UPSTREAM_NAME

# Workaround for storing JSON as bash variable without external library
# DATA=$(cat <<EOF
# '{"title": "Actions Update express_mono to",
# "body": "Please pull these awesome changes in",
# "head": "5-actions-test-v4.0.0",
# "base": "master"}'
# EOF
# )

echo Sending pull request
curl -sSL -H "Authorization: token ${TOKEN}" -H "application/vnd.github.v3+json" -X POST --data '{"title": "Actions Update express_mono to", "body": "Please pull these awesome changes in", "head": "8-actions-test-v4.0.0", "base": "master"}' https://api.github.com/repos/CuBoulder/express-mono-upstream/pulls

echo End Script...