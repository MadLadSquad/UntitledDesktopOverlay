# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit uimgui go-module

DESCRIPTION="A manager for containerised Linux gaming systems based on Incus"
HOMEPAGE="https://github.com/MadLadSquad/UntitledGameSystemManager"
SRC_URI="https://github.com/MadLadSquad/UntitledImGuiFramework/releases/download/v0.8.7.9/untitled-imgui-framework.tar.xz -> untitled-imgui-framework.tar.xz
https://github.com/MadLadSquad/UntitledGameSystemManager/releases/download/v2.0.1.9/untitled-game-system-manager.tar.xz -> untitled-game-system-manager.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT=""

BDEPEND="dev-lang/go
	app-emulation/incus"
DEPEND=""
RDEPEND="app-emulation/incus"

src_unpack() {
	uimgui_src_unpack
}

src_compile() {
	cd "${WORKDIR}"/"${PN}"/IncusBindings/ || die
	go build -mod=vendor -o libUGM_Incus_InternalFuncs.so -buildmode=c-shared . || die
	cd "${S}" || die
	uimgui_src_compile
}