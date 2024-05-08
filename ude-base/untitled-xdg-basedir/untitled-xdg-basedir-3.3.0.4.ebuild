# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit cmake

DESCRIPTION="C/C++ implementation of the XDG Basedir specification"
HOMEPAGE="https://github.com/MadLadSquad/UntitledXDGBasedir"
SRC_URI="https://github.com/MadLadSquad/UntitledXDGBasedir/releases/download/v3.3.0.4/untitled-xdg-basedir.tar.xz -> untitled-xdg-basedir.tar.xz"

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
	local mycmakeargs=(
		-DUIMGUI_INSTALL=ON
		-DCREATE_DIRS=$(usex create_dirs)
		-DNO_IGNORE_RELATIVE_DIRS=$(usex ignore_relative_dirs OFF ON)
	)

	cmake_src_configure
}
