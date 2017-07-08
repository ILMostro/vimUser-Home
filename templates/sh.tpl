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

printf "\v\v <+OUTPUT+> \n"

# test for Error codes
if (( $? )); then echo -e "\v\vfailed"; else echo -e "\v\vOK"; fi

exit
