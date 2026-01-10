# Distributed under the terms of the MIT License

EAPI="8"

inherit cmake

DESCRIPTION="Modern, light, type and memory safe C++ wrapper on top of the dbus-1 library"
HOMEPAGE="https://github.com/MadLadSquad/UntitledDBusUtils"
SRC_URI="$HOMEPAGE/releases/download/v${PV}/${P}.tar.xz -> ${P}.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT=""

BDEPEND="virtual/pkgconfig
	sys-apps/dbus"
DEPEND=""
RDEPEND="sys-apps/dbus"

src_configure() {
	sed -i "s/lib\/pkgconfig/lib64\/pkgconfig/g" "${S}"/CMakeLists.txt

	local mycmakeargs=(
		-DUIMGUI_INSTALL=ON
	)

	cmake_src_configure
}
