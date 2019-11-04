#!/bin/bash
JEKYLL_ENV=production bundle exec jekyll build -d _mlciv_deploy
cd _mlciv_deploy
git pull
git add --all --verbose
git commit -m `date "+%Y%m%d%H%M%S"`
git push origin _mlciv_deploy
cd ..
echo 'Site in _mlciv_deploy deployed!'
