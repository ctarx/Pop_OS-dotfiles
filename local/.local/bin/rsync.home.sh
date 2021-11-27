#!/bin/sh

rsync -avxP --exclude-from=/home/ctarx/rsync_ignore --delete /home/ctarx/ /media/ctarx/Backup/hell/
