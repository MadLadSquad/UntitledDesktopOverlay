# Distributed under the terms of the MIT License

EAPI="7"

inherit cmake

DESCRIPTION="Cross-platform library for executing applications as a separate process"
HOMEPAGE="https://github.com/MadLadSquad/UntitledExec"
SRC_URI="https://github.com/MadLadSquad/UntitledExec/releases/download/v5.0.0.0/untitled-exec.tar.xz -> untitled-exec.tar.xz"

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
