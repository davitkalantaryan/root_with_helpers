#!/bin/bash

# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG

# some defs
rootVersinName=${1}
installDir=${2}
configuration=${3}

scriptFileFullPath=`readlink -f ${0}`
scriptDirectory=`dirname ${scriptFileFullPath}`
cd ${scriptDirectory}/..
repositoryRoot=`pwd`

# thanks to https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux
if [[ "$(uname)" == "Darwin" ]]; then
    lsbCode=mac
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    lsbCode=`lsb_release -sc`
else
    echo "Unsupported platform"
    exit 1
fi

${scriptDirectory}/unix_prepare_repo_once.sh

cd ${repositoryRoot}/.extras/root
git checkout ${rootVersinName}

# line below is because of issue, maybe better solution exist
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/afs/ifh.de/group/pitz/doocs/amd64_rhel60/root/6.02.00/lib

#mkdir <builddir> <installdir>
# build dir
buildDir=${repositoryRoot}/build/${lsbCode}/${configuration}/root-${rootVersinName}
mkdir -p ${buildDir}
# install dir
rm -fr ${installDir}
mkdir -p ${installDir}
# cd to build dir
cd ${buildDir}
cmake -DCMAKE_INSTALL_PREFIX=${installDir} ${repositoryRoot}/root -Dqt=1  -DCMAKE_BUILD_TYPE=Debug -Wno-dev
cmake --build . --target install 
