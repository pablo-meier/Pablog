#!/bin/zsh
#
# A clean script that removes more than just the individual post titles. Maybe
# do a fork request on frog itself so raco frog -c does this on its own.

raco frog -c
rm -rf 20* About.html feeds index.html sitemap.txt tags
find . -name "*.md" -exec sed -i 's/[ \t]*$//g' \{\} \;
find . -name ".*.swp" -exec rm -f \{\} \;
