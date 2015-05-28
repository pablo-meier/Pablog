# Pushes the current build.

rsync --chmod=u=rwx,go=rx -avze 'ssh -p 22' --delete build/ root@198.74.49.231:/root/www
