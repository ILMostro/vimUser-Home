#!/bin/env bash

############################################################################
# <+Heading+>
############################################################################

# set debugging on
set -vx

USAGE="Usage: `basename $0` <+parameter+>"

if [[ -z $1 ]]
then
  echo $USAGE
  exit 1
fi

# test for Error codes
if (( $? )); then echo failed; else echo OK; fi

exit
