#!/bin/sh

DROPBOX=~/Dropbox/
if [ ! -d "$DROPBOX" ]; then
  echo "Setup dropbox sync to $DROPBOX"
else
  echo "Backing up current .ssh folder"
  _now=$(date +"%m_%d_%Y_%s")
  mv ~/.ssh ~/.ssh_backup_$_now
  echo "Symlinking cryfs cloud ssh folder"
  umount ~/.ssh_cloud
  cryfs $DROPBOX/.ssh ~/.ssh_cloud
  ln -s ~/.ssh_cloud ~/.ssh
  echo "...done"
fi
