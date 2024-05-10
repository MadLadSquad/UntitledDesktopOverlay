# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit cmake

DESCRIPTION="Modern, light, type and memory safe C++ wrapper on top of the dbus-1 library"
HOMEPAGE="https://github.com/MadLadSquad/UntitledDBusUtils"
SRC_URI="https://github.com/MadLadSquad/UntitledDBusUtils/releases/download/v0.1.3.0/untitled-dbus-utils.tar.xz -> untitled-dbus-utils.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT=""

BDEPEND="virtual/pkgconfig
	sys-apps/dbus"
DEPEND=""
RDEPEND="sys-apps/dbus"

S="${WORKDIR}"

src_configure() {
	local mycmakeargs=(
		-DUIMGUI_INSTALL=ON
	)

	cmake_src_configure
}
