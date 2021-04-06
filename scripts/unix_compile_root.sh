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


# thanks to https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux
if [[ "$(uname)" == "Darwin" ]]; then
	# Do something under Mac OS X platform
	lsbCode=mac
	qtTarget=clang_64
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
	# Do something under GNU/Linux platform
	lsbCode=`lsb_release -sc`
	qtTarget=gcc_64
#elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
#	# Do something under 32 bits Windows NT platform
#elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]]; then
#	# Do something under 64 bits Windows NT platform
#else
fi

# compile root
# https://root.cern/install/build_from_source/
#cd ${repositoryRoot}/root
#mkdir -p include
#export C_INCLUDE_PATH=$C_INCLUDE_PATH:${repositoryRoot}/root/include
#export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:${repositoryRoot}/root/include
## line below is because of issue, maybe better solution exist
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/afs/ifh.de/group/pitz/doocs/amd64_rhel60/root/6.02.00/lib
#cmake -H. -B../build/root/Debug -DCMAKE_BUILD_TYPE=Debug
#cd ../build/root/Debug
#cmake --build .


#mkdir <builddir> <installdir>
# build dir
installDir=/afs/ifh.de/group/pitz/doocs/data/ers/sys/Nitrogen/opt/root3
mkdir -p ${repositoryRoot}/build/root/Debug
# install dir
rm -fr ${installDir}
mkdir -p ${installDir}
# cd to build dir
cd ${repositoryRoot}/build/root/Debug
cmake -DCMAKE_INSTALL_PREFIX=${installDir} ${repositoryRoot}/root -DCMAKE_BUILD_TYPE=Debug -Wno-dev
cmake --build . --target install 
