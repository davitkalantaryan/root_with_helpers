#!/bin/bash


# https://intoli.com/blog/exit-on-errors-in-bash-scripts/
# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
#trap 'echo "\"${last_command}\" command finished with exit code $?."' EXIT


scriptFileFullPath=`readlink -f ${0}`
scriptDirectory=`dirname ${scriptFileFullPath}`
cd ${scriptDirectory}/..
repositoryRoot=`pwd`

#cd ${repositoryRoot}
#git submodule sync --recursive
#git submodule update --init --recursive

cd ${repositoryRoot}/root
git clean -fxd
git checkout master
