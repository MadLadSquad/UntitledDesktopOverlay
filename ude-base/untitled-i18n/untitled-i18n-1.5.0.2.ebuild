# Distributed under the terms of the MIT License

EAPI="7"

inherit cmake

DESCRIPTION="Next generation C/C++ i18n library"
HOMEPAGE="https://github.com/MadLadSquad/UntitledI18N"
SRC_URI="$HOMEPAGE/releases/download/v${PV}/${P}.tar.xz -> ${P}.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT=""

BDEPEND="virtual/pkgconfig
	dev-cpp/yaml-cpp"
DEPEND=""
RDEPEND="dev-cpp/yaml-cpp"

src_configure() {
	sed -i "s/lib\/pkgconfig/lib64\/pkgconfig/g" "${S}"/CMakeLists.txt
	local mycmakeargs=(
		-DUIMGUI_INSTALL=ON
	)

	cmake_src_configure
}
