#!/bin/bash

#
# example
# export PATH=~/ers/scripts:${PATH}
# configuration=Debug
# lsbCode=$(lsb_release -sc)
# rootVersinName=v6-02-00_patch01
# installDir=/afs/ifh.de/group/pitz/doocs/ers/sys/${lsbCode}/rootv/${rootVersinName}
# ./scripts/unix_compile_root_args_version_installpath_conf.sh ${rootVersinName} ${installDir} ${configuration} ~/ers/sys/${lsbCode}/opt/Qt/4.8.7.m1/bin/qmake
#

# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG

# some defs
rootVersinName=${1}
installDir=${2}
configuration=${3}
if [ $# -gt 3 ]; then
    QmakeQt4Path=${4}
    echo "QmakeQt4Path=${QmakeQt4Path}"
    ExtraOptions="${ExtraOptions} -Dqt=ON -DQT_QMAKE_EXECUTABLE=${QmakeQt4Path}/bin/qmake -DQT_INSTALL_LIBS=${QmakeQt4Path}"
fi
echo ExtraOptions=$ExtraOptions

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

rootDir=${repositoryRoot}/.extras/root

cd ${rootDir}
git clean -xfd
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
# cmake -DCMAKE_INSTALL_PREFIX=${installDir} ${rootDir} -Dqt=ON -DCMAKE_BUILD_TYPE=${configuration} -Wno-dev
# cmake -DCMAKE_INSTALL_PREFIX=${installDir} ${rootDir} -Dqt=ON -DCMAKE_BUILD_TYPE=${configuration} -Wno-dev
# cmake -DCMAKE_INSTALL_PREFIX=${installDir} ${rootDir} -Dqt=ON -DCMAKE_BUILD_TYPE=${configuration} -Wno-dev -DQT_QMAKE_EXECUTABLE=<path-to-qt4-qmake>
# cmake -DCMAKE_INSTALL_PREFIX=${installDir} ${rootDir} -Dqt=ON -DCMAKE_BUILD_TYPE=${configuration} -Wno-dev -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
cmake -DCMAKE_INSTALL_PREFIX=${installDir} ${rootDir} -Dqt=1  -DCMAKE_BUILD_TYPE=${configuration} -Wno-dev ${ExtraOptions}
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${buildDir}/lib
cmake --build . --target install 
