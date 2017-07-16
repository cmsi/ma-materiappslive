#!/bin/sh
. $(dirname $0)/path.sh

VM="madev8-amd64"
for v in $VM; do
  cd $HOME/vagrant/$v
  vagrant ssh -c "sh development/ma-${PACKAGE}/update.sh"
done
