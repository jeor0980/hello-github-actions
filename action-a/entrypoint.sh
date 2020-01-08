#!/bin/sh -l

sh -c "Printing global variables..."
echo GITHUB_REF
echo GITHUB_SHA

sh -c "Start script..."

git clone git@github.com:CuBoulder/express-mono-upstream.git
git checkout -b EXPRESS_VERSION
cd profiles
rm -rf express
git clone git@github.com:CuBoulder/express_mono.git express
cd express
git checkout tags/$EXPRESS_VERSION
cd ..
git add express
git commit -m "Updating express_mono to $EXPRESS_VERSION"
git push --set-upstream origin EXPRESS_VERSION

sh -c "End Script..."