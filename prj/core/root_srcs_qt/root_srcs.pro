
TEMPLATE = aux

repoRootPath=$${PWD}/../../..

ROOT_SRCS_PP   = $$system($${repoRootPath}/scripts/findfiles $${repoRootPath}/root .cpp)
ROOT_SRCS_XX   = $$system($${repoRootPath}/scripts/findfiles $${repoRootPath}/root .cxx)
#ROOT_SRCS_CC   = $$system($${repoRootPath}/scripts/findfiles $${repoRootPath}/root .cc)
ROOT_HDRS      = $$system($${repoRootPath}/scripts/findfiles $${repoRootPath}/root .h)
ROOT_HDRSPP    = $$system($${repoRootPath}/scripts/findfiles $${repoRootPath}/root .hpp)

INCLUDEPATH += $${repoRootPath}/root/core/base/inc
INCLUDEPATH += $${repoRootPath}/root/core/meta/inc

INCLUDEPATH += $${repoRootPath}/root/core/cont/inc

INCLUDEPATH += $${repoRootPath}/root/graf2d/gpad/inc
INCLUDEPATH += $${repoRootPath}/root/graf2d/graf/inc
INCLUDEPATH += $${repoRootPath}/root/math/mathcore/inc

SOURCES =  $$ROOT_SRCS_PP
SOURCES += $$ROOT_SRCS_XX

HEADERS =  $$ROOT_HDRS
HEADERS += $$ROOT_HDRSPP
