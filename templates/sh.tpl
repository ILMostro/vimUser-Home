#!/bin/env bash

############################################################################
# <+Heading+>
############################################################################

# set debugging on
# set -vx
# Set some default options
set -eu
set -o pipefail

USAGE="Usage: `basename $0` <+parameter+>"

if [[ -z $1 ]]
then
  echo $USAGE
  exit 1
fi

<+VARS+>

# test for Error codes
if (( $? )); then echo failed; else echo OK; fi

exit
