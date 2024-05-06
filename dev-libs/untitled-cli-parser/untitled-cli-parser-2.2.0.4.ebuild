# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit cmake

DESCRIPTION="C/C++ parser for CLI arguments"
HOMEPAGE="https://github.com/MadLadSquad/UntitledCLIParser"
SRC_URI="https://github.com/MadLadSquad/UntitledCLIParser/releases/download/v2.2.0.4/untitled-cli-parser.tar.xz -> untitled-cli-parser.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="unicode"
RESTRICT=""

BDEPEND=""
DEPEND=""
RDEPEND="unicode? ( dev-libs/utfcpp )"

S="${WORKDIR}"

src_configure() {
	local mycmakeargs=(
		-DUIMGUI_INSTALL=ON
		-DBUILD_VARIANT_VENDOR=OFF
		-DWITH_UTF8=$(usex unicode)
	)

	cmake_src_configure
}
