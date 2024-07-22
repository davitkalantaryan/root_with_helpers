
TEMPLATE = subdirs
#CONFIG += ordered

message("!!! $${_PRO_FILE_}")

include ( "$${PWD}/../../prj/common/common_qt/flagsandsys_common_private.pri" )

SUBDIRS		+=	$${rootWithHelpersRepositoryRoot}/prj/core/root_srcs_qt/root_srcs.pro
SUBDIRS		+=	$${rootWithHelpersRepositoryRoot}/prj/core/libgqt_for_emwiz_qt/libgqt_for_emwiz.pro

compileQtProFromRoot {
        SUBDIRS		+=	$${rootWithHelpersRepositoryRoot}/root/graf2d/qt/qt.pro
}


OTHER_FILES += $$files($${rootWithHelpersRepositoryRoot}/scripts/*.sh,true)
OTHER_FILES += $$files($${rootWithHelpersRepositoryRoot}/scripts/*.bat,true)
OTHER_FILES += $$files($${rootWithHelpersRepositoryRoot}/scripts/.raw/*.sh,true)
OTHER_FILES += $$files($${rootWithHelpersRepositoryRoot}/scripts/.raw/*.bat,true)

OTHER_FILES	+=	\
        $${PWD}/../../.gitattributes	\
	$${PWD}/../../.gitignore	\
	$${PWD}/../../.gitmodules	\
	$${PWD}/../../README.md
