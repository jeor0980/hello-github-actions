#!/bin/bash

git config --global user.email 'osr_web_deploy@colorado.edu'
git config --global user.name 'osrwebdeploy'

echo Printing global variables...
echo $GITHUB_REF
echo $GITHUB_SHA
echo Start script...
git clone https://github.com/CuBoulder/express-mono-upstream.git
cd express-mono-upstream
git checkout -b $EXPRESS_VERSION
ls -al
cd profiles
rm -rf express
git clone https://github.com/CuBoulder/express_mono.git express
cd express
git checkout $EXPRESS_VERSION
cd ..
git add express
git commit -m "Updating express_mono to $EXPRESS_VERSION"
git push --set-upstream origin $EXPRESS_VERSION
echo End Script...