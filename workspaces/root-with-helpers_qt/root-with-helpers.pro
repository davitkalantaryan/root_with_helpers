
TEMPLATE = subdirs
#CONFIG += ordered

repositoryRoot	= $${PWD}/../..

SUBDIRS		+=	$${repositoryRoot}/prj/core/root_srcs_qt/root_srcs.pro
SUBDIRS		+=	$${repositoryRoot}/prj/core/libgqt_for_emwiz_qt/libgqt_for_emwiz.pro

compileQtProFromRoot {
	SUBDIRS		+=	$${PWD}/../../root/graf2d/qt/qt.pro
}


OTHER_FILES	+=	\
	$${PWD}/../../.gitattributes													\
	$${PWD}/../../.gitignore														\
	$${PWD}/../../.gitmodules														\
	$${PWD}/../../README.md															\
	\
	$${PWD}/../../scripts/findfiles													\
	$${PWD}/../../scripts/findfiles.bat												\
	$${PWD}/../../scripts/unix_clean_repository.sh									\
	$${PWD}/../../scripts/unix_compile_root_5_24.sh									\
	$${PWD}/../../scripts/unix_compile_root_5_34_00.sh								\
	$${PWD}/../../scripts/unix_compile_root_6_02_00.sh								\
	$${PWD}/../../scripts/unix_copy_all_sources.sh									\
