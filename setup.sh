#!/bin/sh
. $(dirname $0)/path.sh
test -z $BUILD_DIR && exit 127

rm -rf $BUILD_DIR
set -x

mkdir -p $BUILD_DIR
cp -frp $SCRIPT_DIR/applications $SCRIPT_DIR/debian $SCRIPT_DIR/etc $SCRIPT_DIR/wiki $BUILD_DIR
