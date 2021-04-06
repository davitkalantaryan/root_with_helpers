
TEMPLATE = subdirs
#CONFIG += ordered


SUBDIRS		+=	$${PWD}/../../prj/core/root_srcs_qt/root_srcs.pro
SUBDIRS		+=	$${PWD}/../../root/graf2d/qt/qt.pro


OTHER_FILES	+=	\
	$${PWD}/../../.gitattributes													\
	$${PWD}/../../.gitignore														\
	$${PWD}/../../.gitmodules														\
	$${PWD}/../../README.md															\
	\
	$${PWD}/../../scripts/findfiles													\
	$${PWD}/../../scripts/findfiles.bat												\
	$${PWD}/../../scripts/unix_compile_root.sh										\

