#  
# file:			gqt_for_emwiz.pri  
# path:			${repositoryRoot}/prj/common/common_qt/gqt_for_emwiz.pri  
# created on:	2021 Apr 07  
# created by:	Davit Kalantaryan (davit.kalantaryan@desy.de)  
#
# purpose:		To have file that will include all sources necessary for 
#				Emwiz compilation missing from libGQt library
#

# some defs
include ( $${PWD}/sys_common.pri )
ROOTSYS			= /afs/ifh.de/group/pitz/doocs/data/ers/sys/$$CODENAME/opt/root-v6-02-00

LIBS += -lpcre

repositoryRoot  = $${PWD}/../../..
gQtIncludeDir   = $${repositoryRoot}/include/gqt_for_emwiz/fromroot
gQtSourceDir	= $${repositoryRoot}/src/gqt_for_emwiz/fromroot

INCLUDEPATH += $${repositoryRoot}/include
INCLUDEPATH += $${gQtIncludeDir}
#INCLUDEPATH += $${repositoryRoot}/root/graf2d/qt/inc

QMAKE_CXXFLAGS += $$system($$ROOTSYS/bin/root-config --cflags)

win32 {
	QMAKE_CXXFLAGS += /FI"extra/first_include_for_fixing_issues.h"
} else {
	QMAKE_CXXFLAGS += -Wno-misleading-indentation
	QMAKE_CXXFLAGS += -Wno-implicit-fallthrough
	QMAKE_CXXFLAGS += -include"gqt_for_emwiz/extra/first_include_for_fixing_issues.h"
}

#DEFINES += __CINT__
#DEFINES += Q_MOC_RUN2
DEFINES += GQT_FOR_EMWIZ_USED

SOURCES += \
	$${repositoryRoot}/src/gqt_for_emwiz/extra/gqt_for_emwiz_extra01.cpp

HEADERS += \
	$${repositoryRoot}/include/gqt_for_emwiz/extra/first_include_for_fixing_issues.h			\
	$${repositoryRoot}/include/gqt_for_emwiz/extra/gqt_for_emwiz.h


SRCS_FROMROOT   = $$system( $${repositoryRoot}/scripts/findfiles $${gQtSourceDir} .cxx)
INCS_FROMROOT   = $$system( $${repositoryRoot}/scripts/findfiles $${gQtIncludeDir} .h)

SOURCES += $$SRCS_FROMROOT
HEADERS += $$INCS_FROMROOT

#SOURCES +=	\
#	$${gQtSourceDir}/GQtGUI.cxx					\
#	$${gQtSourceDir}/TGQtDummy.cxx				\
#	$${gQtSourceDir}/TQtWidget.cxx				\
#	$${gQtSourceDir}/TGQt.cxx					\
#	$${gQtSourceDir}/TQtTimer.cxx				\
#	$${gQtSourceDir}/TQtApplication.cxx			\
#	$${gQtSourceDir}/TQtPen.cxx					\
#	$${gQtSourceDir}/TQtBrush.cxx				\
#	$${gQtSourceDir}/TQtMarker.cxx				\
#	$${gQtSourceDir}/TQtPadFont.cxx				\
#	$${gQtSourceDir}/TQtClientFilter.cxx		\
#	$${gQtSourceDir}/TQtClientGuard.cxx			\
#	$${gQtSourceDir}/TQtSymbolCodec.cxx			\
#	$${gQtSourceDir}/TQtClientWidget.cxx		\
#	$${gQtSourceDir}/TQtEventQueue.cxx			\
#
#
#HEADERS += \
#	$${gQtIncludeDir}/TQtWidget.h				\
#	$${gQtIncludeDir}/TGQt.h					\
#	$${gQtIncludeDir}/TQtTimer.h				\
#	$${gQtIncludeDir}/TQtApplication.h			\
#	$${gQtIncludeDir}/TQtPen.h					\
#	$${gQtIncludeDir}/TQtBrush.h				\
#	$${gQtIncludeDir}/TQtMarker.h				\
#	$${gQtIncludeDir}/TQtPadFont.h				\
#	$${gQtIncludeDir}/TQtClientFilter.h			\
#	$${gQtIncludeDir}/TQtClientGuard.h			\
#	$${gQtIncludeDir}/TQtEmitter.h				\
#	$${gQtIncludeDir}/TQtSymbolCodec.h			\
#	$${gQtIncludeDir}/TQtClientWidget.h			\
#	$${gQtIncludeDir}/TQtEventQueue.h			\

