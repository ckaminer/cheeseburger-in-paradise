#!/bin/bash

# Build site locally with custom plugins
JEKYLL_ENV=deploy jekyll build

# clear out current static site for clean slate
rm -rf ../personal-site-static/*

# move newly built _site into static site repository
cp -R _site/* ../personal-site-static

# publish updated static site to Github
cd ../personal-site-static
git add .
git commit -m "Update static site"
git push https://ckaminer:$GITHUB_PASS@github.com/ckaminer/ckaminer.github.io.git --all