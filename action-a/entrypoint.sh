#!/bin/sh -l


  sh -c "git config --global user.email 'osr_web_deploy@colorado.edu'"
  sh -c "git config --global user.name 'osrwebdeploy'"

sh -c "echo Printing global variables..."
sh -c "echo $GITHUB_REF"
sh -c "echo $GITHUB_SHA"
sh -c "echo Start script..."
sh -c "git clone git@github.com:CuBoulder/express-mono-upstream.git"
sh -c "git checkout -b $EXPRESS_VERSION"
sh -c "cd profiles"
sh -c "rm -rf express"
sh -c "git clone git@github.com:CuBoulder/express_mono.git express"
sh -c "cd express"
sh -c "git checkout tags/$EXPRESS_VERSION"
sh -c "cd .."
sh -c "git add express"
sh -c "git commit -m "Updating express_mono to $EXPRESS_VERSION""
sh -c "git push --set-upstream origin $EXPRESS_VERSION"
sh -c "echo End Script..."