# Distributed under the terms of the MIT License

EAPI="7"

inherit cmake

DESCRIPTION="C/C++ implementation of the XDG Basedir specification"
HOMEPAGE="https://github.com/MadLadSquad/UntitledXDGBasedir"
SRC_URI="https://github.com/MadLadSquad/UntitledXDGBasedir/releases/download/v5.0.0.0/untitled-xdg-basedir.tar.xz -> untitled-xdg-basedir.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="-create_dirs ignore_relative_dirs"
RESTRICT=""

BDEPEND="virtual/pkgconfig"
DEPEND=""
RDEPEND=""

S="${WORKDIR}"

src_configure() {
	sed -i "s/lib\/pkgconfig/lib64\/pkgconfig/g" "${S}"/CMakeLists.txt
	local mycmakeargs=(
		-DUIMGUI_INSTALL=ON
		-DCREATE_DIRS=$(usex create_dirs)
		-DNO_IGNORE_RELATIVE_DIRS=$(usex ignore_relative_dirs OFF ON)
	)

	cmake_src_configure
}
