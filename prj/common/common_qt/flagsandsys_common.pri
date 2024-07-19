#
# repo:			root_with_helpers
# name:			flagsandsys_common.pri
# path:			prj/common/common_qt/flagsandsys_common.pri
# created on:   2024 Jul 19
# created by:   Davit Kalantaryan (davit.kalantaryan@desy.de)
# usage:		Use this qt include file to calculate some platform specific stuff
#

message("!!! $${PWD}/flagsandsys_common.pri")

isEmpty(rootWithHelpersFlagsAndSysCommonIncluded){

    rootWithHelpersFlagsAndSysCommonIncluded = 1

    rootWithHelpersRepositoryRoot = $${PWD}/../../..

    isEmpty(artifactRoot) {
        artifactRoot = $$(artifactRoot)
        isEmpty(artifactRoot) {
	    artifactRoot = $${rootWithHelpersRepositoryRoot}
        }
    }

    INCLUDEPATH += $${rootWithHelpersRepositoryRoot}/include

    LIBS	+= -L$${rootWithHelpersRepositoryRoot}/sys/$${CODENAME}/$$CONFIGURATION/lib
    LIBS	+= -L$${rootWithHelpersRepositoryRoot}/sys/$${CODENAME}/$$CONFIGURATION/tlib
    

    #CONFIG += c++14
}
