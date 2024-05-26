#!/bin/zsh

if [ $# -eq 0 ]
then
    echo "No arguments supplied"
    exit 1
fi

node node_modules/.bin/jest "$1" -c ~/workplace/avlrc-dev/src/AVLivingRoomClient/packages/jest.config.js  --coverage=false --testPathIgnorePatterns=__enormous__ --watch

