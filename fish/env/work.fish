set -x hb /mnt/c/Users/GersonGallo/projects/homebuilders
test -f $HOME/.ssh/contollo_rsa
and keychain -Q --quiet --eval contollo_rsa | source
