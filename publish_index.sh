#!/bin/bash
JEKYLL_ENV=production bundle exec jekyll build -d _index_deploy
cd _index_deploy
git add --all --verbose
git commit -m `date "+%Y%m%d%H%M%S"`
git push origin _index_deploy
cd ..
echo 'Site in _index_deploy deployed!'
