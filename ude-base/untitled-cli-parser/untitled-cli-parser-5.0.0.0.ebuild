# Distributed under the terms of the MIT License

EAPI="7"

inherit cmake

DESCRIPTION="C/C++ parser for CLI arguments"
HOMEPAGE="https://github.com/MadLadSquad/UntitledCLIParser"
SRC_URI="https://github.com/MadLadSquad/UntitledCLIParser/releases/download/v5.0.0.0/untitled-cli-parser.tar.xz -> untitled-cli-parser.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT=""

BDEPEND="virtual/pkgconfig"
DEPEND=""
RDEPEND=""

S="${WORKDIR}"

src_configure() {
	sed -i "s/lib\/pkgconfig/lib64\/pkgconfig/g" "${S}"/CMakeLists.txt
	local mycmakeargs=(
		-DUIMGUI_INSTALL=ON
	)

	cmake_src_configure
}
