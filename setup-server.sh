#!/bin/sh

sudo apt update && sudo apt upgrade && sudo apt install apache2

ROOT=/var/www/html

git clone https://github.com/grubbymits/grubbymitsdotdev.git
sudo cp grubbymitsdotdev/grubbymits.html $ROOT/index.html
sudo cp grubbymitsdotdev/favicon.ico $ROOT/
sudo cp -r grubbymitsdotdev/css $ROOT/
sudo cp -r grubbymitsdotdev/assets $ROOT/
sudo cp -r grubbymitsdotdev/fonts $ROOT/

git clone https://github.com/grubbymits/space-shooter.git
sudo mkdir $ROOT/space-shooter
sudo cp space-shooter/play.html $ROOT/space-shooter/
sudo cp -r space-shooter/css $ROOT/space-shooter/
sudo cp -r space-shooter/js $ROOT/space-shooter/
sudo cp -r space-shooter/res $ROOT/space-shooter/

git clone https://github.com/grubbymits/noisey-world.git
sudo mkdir $ROOT/noisey-world
sudo cp -r noisey-world/web/* $ROOT/noisey-world/

git clone https://github.com/grubbymits/dungen.git
sudo mkdir $ROOT/dungen
sudo cp dungen/*.html $ROOT/dungen/
sudo cp dungen/manifest.json $ROOT/dungen/
sudo cp -r dungen/css $ROOT/dungen/
sudo cp -r dungen/js $ROOT/dungen/
sudo cp -r dungen/font $ROOT/dungen/
sudo cp -r dungen/res $ROOT/dungen/
