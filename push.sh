#!/bin/zsh
#
# Script to copy this to whatever server I'm hosting the blog on.

DST_SERVER=root@198.74.49.231
DST_PATH=/root/www/

CMD="rsync --chmod=u=rwx,go=rx -avze 'ssh -p 22' --exclude-from=.rsync-exclude --delete ./ $DST_SERVER:$DST_PATH"
echo "Executing $CMD..."

rsync --chmod=u=rwx,go=rx -avze 'ssh -p 22' --exclude-from=.rsync-exclude --delete ./ $DST_SERVER:$DST_PATH
