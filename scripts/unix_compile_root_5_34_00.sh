#!/bin/bash


# https://intoli.com/blog/exit-on-errors-in-bash-scripts/
# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
#trap 'echo "\"${last_command}\" command finished with exit code $?."' EXIT

# some defs
rootVersinName=v5-99-02
configuration=Debug

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

cd ${repositoryRoot}/root
git checkout ${rootVersinName}

# for cmake 
#export PATH=/afs/ifh.de/group/pitz/doocs/data/ers/sys/${lsbCode}/cmake-3.20.0/bin:$PATH
#which g++
#exit 0

# think on calling below line
# source /afs/ifh.de/group/pitz/doocs/data/ers/sys/${lsbCode}/opt/rh/devtoolset-7/enable 
#  or  
# export PATH=/afs/ifh.de/group/pitz/doocs/data/ers/sys/Santiago/opt/gcc/7.3.0/bin:$PATH
# export CPLUS_INCLUDE_PATH=/afs/ifh.de/group/pitz/doocs/data/ers/sys/Santiago/opt/gcc/7.3.0/include/c++/7.3.0
# export LD_LIBRARY_PATH=/afs/ifh.de/group/pitz/doocs/data/ers/sys/Santiago/opt/gcc/7.3.0/lib64:$LD_LIBRARY_PATH
# export LIBRARY_PATH=/afs/ifh.de/group/pitz/doocs/data/ers/sys/Santiago/opt/gcc/7.3.0/lib64:$LIBRARY_PATH
#

#
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
installDir=/afs/ifh.de/group/pitz/doocs/data/ers/sys/${lsbCode}/opt/root-${rootVersinName}
buildDir=${repositoryRoot}/build/${lsbCode}/${configuration}/root-${rootVersinName}
mkdir -p ${buildDir}
# install dir
rm -fr ${installDir}
mkdir -p ${installDir}
# cd to build dir
cd ${buildDir}
#cmake -DCMAKE_INSTALL_PREFIX=${installDir} ${repositoryRoot}/root -DCMAKE_BUILD_TYPE=Debug -Wno-dev
cmake -DCMAKE_INSTALL_PREFIX=${installDir} ${repositoryRoot}/root -Dqt=1  -DCMAKE_BUILD_TYPE=Debug -Wno-dev
cmake --build . --target install 
