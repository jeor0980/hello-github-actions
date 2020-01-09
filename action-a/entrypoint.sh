#!/bin/bash

echo Printing global variables...
echo $GITHUB_REF
echo $GITHUB_SHA
echo Start script...
echo Cloning express-mono-upstream
git clone https://osrwebdeploy:<MYTOKEN>git@github.com/CuBoulder/express-mono-upstream.git
cd express-mono-upstream
git checkout -b $EXPRESS_VERSION
ls -al
cd profiles
rm -rf express
echo Cloning express_mono
git clone https://osrwebdeploy:<MYTOKEN>git@github.com/CuBoulder/express_mono.git express
cd express
git checkout $EXPRESS_VERSION
cd ..
git add express
git commit -m "Updating express_mono to $EXPRESS_VERSION"
echo Pushing changes...
git push --set-upstream origin $EXPRESS_VERSION
echo End Script...