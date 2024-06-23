# Distributed under the terms of the MIT License

EAPI="7"

inherit cmake

DESCRIPTION="Cross-platform C/C++ library for opening links and file pickers natively"
HOMEPAGE="https://github.com/MadLadSquad/UntitledExec"
SRC_URI="https://github.com/MadLadSquad/UntitledOpen/releases/download/v2.1.0.0/untitled-open.tar.xz -> untitled-open.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT=""

BDEPEND="virtual/pkgconfig
	sys-apps/dbus"
DEPEND=""
RDEPEND="sys-apps/dbus
	sys-apps/xdg-desktop-portal
"

S="${WORKDIR}"

src_configure() {
	local mycmakeargs=(
		-DUIMGUI_INSTALL=ON
		-DBUILD_SHARED_LIBS=OFF
	)

	cmake_src_configure
}
