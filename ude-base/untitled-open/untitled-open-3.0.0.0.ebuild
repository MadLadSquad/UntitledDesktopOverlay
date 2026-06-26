# Distributed under the terms of the MIT License

EAPI="8"

inherit cmake

DESCRIPTION="Cross-platform C/C++ library for opening links and file pickers natively"
HOMEPAGE="https://github.com/MadLadSquad/UntitledOpen"
SRC_URI="$HOMEPAGE/releases/download/v${PV}/${P}.tar.xz -> ${P}.tar.xz"

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

src_configure() {
	sed -i "s/lib\/pkgconfig/lib64\/pkgconfig/g" "${S}"/CMakeLists.txt
	local mycmakeargs=(
		-DUIMGUI_INSTALL=ON
		-DBUILD_SHARED_LIBS=OFF
	)

	cmake_src_configure
}
