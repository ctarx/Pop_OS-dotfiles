#!/bin/sh

rsync -avxP --exclude-from=/home/ctarx/rsync_ignore --delete /home/$USER/ /media/ctarx/Backup/hell/
