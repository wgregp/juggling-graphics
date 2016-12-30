#! /bin/bash

DIR="/Users/phillips/code/Projects/juggling-graphics"
DEPLOY_SOURCE_DIR="build/"
DEPLOY_DEST_DIR="~/dev.juggling.graphics/"
DEPLOY_SERVER=juggling.graphics
DEPLOY_ACCOUNT=jugglinggraphics

echo " "
echo "Syncing ${DIR}/${DEPLOY_SOURCE_DIR} to ${DEPLOY_ACCOUNT}@${DEPLOY_SERVER}:${DEPLOY_DEST_DIR}"
rsync -rvzt --delete  "${DIR}/${DEPLOY_SOURCE_DIR}" "${DEPLOY_ACCOUNT}@${DEPLOY_SERVER}:${DEPLOY_DEST_DIR}"
