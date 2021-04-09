#!/bin/bash


# https://intoli.com/blog/exit-on-errors-in-bash-scripts/
# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
#trap 'echo "\"${last_command}\" command finished with exit code $?."' EXIT

# some defs
rootVersinName=v6-02-00

scriptFileFullPath=`readlink -f ${0}`
scriptDirectory=`dirname ${scriptFileFullPath}`
cd ${scriptDirectory}/..
repositoryRoot=`pwd`

destinationSrcDir=${repositoryRoot}/src/gqt_for_emwiz/fromroot
destinationIncDir=${repositoryRoot}/include/gqt_for_emwiz/fromroot

mkdir -p ${destinationSrcDir}
mkdir -p ${destinationIncDir}


cp ${repositoryRoot}/root/graf2d/qt/src/GQtGUI.cxx					${destinationSrcDir}/.
cp ${repositoryRoot}/root/graf2d/qt/src/TGQtDummy.cxx				${destinationSrcDir}/.
cp ${repositoryRoot}/root/graf2d/qt/src/TQtWidget.cxx				${destinationSrcDir}/.
cp ${repositoryRoot}/root/graf2d/qt/src/TGQt.cxx					${destinationSrcDir}/.
cp ${repositoryRoot}/root/graf2d/qt/src/TQtTimer.cxx				${destinationSrcDir}/.
cp ${repositoryRoot}/root/graf2d/qt/src/TQtApplication.cxx			${destinationSrcDir}/.
cp ${repositoryRoot}/root/graf2d/qt/src/TQtPen.cxx					${destinationSrcDir}/.
cp ${repositoryRoot}/root/graf2d/qt/src/TQtBrush.cxx				${destinationSrcDir}/.
cp ${repositoryRoot}/root/graf2d/qt/src/TQtMarker.cxx				${destinationSrcDir}/.
cp ${repositoryRoot}/root/graf2d/qt/src/TQtPadFont.cxx				${destinationSrcDir}/.
cp ${repositoryRoot}/root/graf2d/qt/src/TQtClientFilter.cxx			${destinationSrcDir}/.
cp ${repositoryRoot}/root/graf2d/qt/src/TQtClientGuard.cxx			${destinationSrcDir}/.
cp ${repositoryRoot}/root/graf2d/qt/src/TQtSymbolCodec.cxx			${destinationSrcDir}/.
cp ${repositoryRoot}/root/graf2d/qt/src/TQtClientWidget.cxx			${destinationSrcDir}/.
cp ${repositoryRoot}/root/graf2d/qt/src/TQtEventQueue.cxx			${destinationSrcDir}/.

chmod a-x ${repositoryRoot}/src/gqt_for_emwiz/*.cxx


cp ${repositoryRoot}/root/graf2d/qt/inc/TQtWidget.h					${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TGQt.h						${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TQtTimer.h					${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TQtApplication.h			${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TQtPen.h					${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TQtBrush.h					${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TQtMarker.h					${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TQtPadFont.h				${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TQtClientFilter.h			${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TQtClientGuard.h			${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TQtEmitter.h				${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TQtSymbolCodec.h			${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TQtClientWidget.h			${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TQtEventQueue.h				${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TQtRConfig.h				${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TQtLock.h					${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TVirtualX.interface.h		${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TQUserEvent.h				${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TQtCanvasPainter.h			${destinationIncDir}/.
cp ${repositoryRoot}/root/graf2d/qt/inc/TQMimeTypes.h				${destinationIncDir}/.

chmod a-x ${repositoryRoot}/include/gqt_for_emwiz/*.h
