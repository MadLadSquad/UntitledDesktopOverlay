# Distributed under the terms of the MIT License

EAPI="8"

inherit cmake

DESCRIPTION="Cross-platform library for executing applications as a separate process"
HOMEPAGE="https://github.com/MadLadSquad/UntitledExec"
SRC_URI="$HOMEPAGE/releases/download/v${PV}/${P}.tar.xz -> ${P}.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT=""

BDEPEND="virtual/pkgconfig"
DEPEND=""
RDEPEND=""

src_configure() {
	sed -i "s/lib\/pkgconfig/lib64\/pkgconfig/g" "${S}"/CMakeLists.txt
	local mycmakeargs=(
		-DUIMGUI_INSTALL=ON
	)

	cmake_src_configure
}
