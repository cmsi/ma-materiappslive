#!/bin/sh

head -1 $(dirname $0)/materiappslive/debian/changelog | sed 's/[()]/ /g' | awk '{print $2}'
