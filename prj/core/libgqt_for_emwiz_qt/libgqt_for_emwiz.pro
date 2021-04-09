#  
# file:			libgqt_for_emwiz.pro  
# path:			${repositoryRoot}/prj/core/libgqt_for_emwiz_qt/libgqt_for_emwiz.pro  
# created on:	2021 Apr 07  
# created by:	Davit Kalantaryan (davit.kalantaryan@desy.de)  
#
# purpose:		To have file that will include all sources necessary for 
#				Emwiz compilation missing from libGQt library
#

repositoryRoot	= $${PWD}/../../..

TEMPLATE = lib

# include ( $${repositoryRoot}/prj/common/common_qt/sys_common.pri )
include ( $${repositoryRoot}/prj/common/common_qt/gqt_for_emwiz.pri )
