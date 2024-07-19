
TEMPLATE = aux

message("!!! $${_PRO_FILE_}")
include ( "$${PWD}/../../common/common_qt/flagsandsys_common_private.pri" )


CORE_ROOT_DIR = $${rootWithHelpersRepositoryRoot}/.extras/root


SOURCES += $$files($${CORE_ROOT_DIR}/*.cpp,true)
SOURCES += $$files($${CORE_ROOT_DIR}/*.cxx,true)
SOURCES += $$files($${CORE_ROOT_DIR}/*.c,true)

HEADERS += $$files($${CORE_ROOT_DIR}/*.h,true)
HEADERS += $$files($${CORE_ROOT_DIR}/*.hpp,true)

INCLUDEPATH += $${CORE_ROOT_DIR}/core/base/inc
INCLUDEPATH += $${CORE_ROOT_DIR}/core/meta/inc
INCLUDEPATH += $${CORE_ROOT_DIR}/core/cont/inc
INCLUDEPATH += $${CORE_ROOT_DIR}/graf2d/gpad/inc
INCLUDEPATH += $${CORE_ROOT_DIR}/graf2d/graf/inc
INCLUDEPATH += $${CORE_ROOT_DIR}/math/mathcore/inc
