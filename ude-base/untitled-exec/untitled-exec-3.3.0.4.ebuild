# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit cmake

DESCRIPTION="Cross-platform library for executing applications as a separate process"
HOMEPAGE="https://github.com/MadLadSquad/UntitledExec"
SRC_URI="https://github.com/MadLadSquad/UntitledExec/releases/download/v3.3.0.4/untitled-exec.tar.xz -> untitled-exec.tar.xz"

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
	local mycmakeargs=(
		-DUIMGUI_INSTALL=ON
	)

	cmake_src_configure
}
