#!/bin/bash
set -e
cd $(dirname $0)/
echo "==============="
date
#git pull
DIE=1 REDEFINE=1 php update.php
#DIE=1 REDEFINE=1 DROPDB=1 php update.php
#DIE=1 REDEFINE=1 REPO=42 php update.php
unset REDEFINE
unset DROPDB
DIE=1 php update.php
date
echo
echo "update finished"
echo "==============="
