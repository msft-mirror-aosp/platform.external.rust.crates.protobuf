#!/bin/bash

# $1 Path to the new version.
# $2 Path to the old version.

set -x
set -e

# out/version.rs should be copied after cargo build.
# Change src/lib.rs to include files from ../out/
SRCFILE=src/lib.rs
OLDSTR='include!(concat!(env!("OUT_DIR"), "/version.rs"));'
NEWSTR='include!("../out/version.rs");  // ANDROID'
sed -i -e "s:$OLDSTR:$NEWSTR:" $SRCFILE
# Make sure that sed replaced $OLDSTR with $NEWSTR
grep "$NEWSTR" $SRCFILE > /dev/null
