#!/bin/bash

scriptFileFullPath=`readlink -f ${0}`
scriptDirectory=`dirname ${scriptFileFullPath}`

# some defs
rootVersinName=v6-02-00
#installDir=/afs/ifh.de/group/pitz/doocs/data/ers/sys/${lsbCode}/opt/root-${rootVersinName}
installDir=${scriptDirectory}/../install/${rootVersinName}
configuration=Debug

${scriptDirectory}/unix_compile_root_args_version_installpath_conf.sh \
    ${rootVersinName} ${installDir} ${configuration}
