# Distributed under the terms of the MIT License

EAPI="7"

inherit uimgui go-module

DESCRIPTION="A manager for containerised Linux gaming systems based on Incus"
HOMEPAGE="https://github.com/MadLadSquad/UntitledGameSystemManager"
SRC_URI="https://github.com/MadLadSquad/UntitledGameSystemManager/releases/download/v2.7.0.0/untitled-game-system-manager.tar.xz -> untitled-game-system-manager.tar.xz"

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
	cd "${S}"/IncusBindings/ || die
	go build -mod=vendor -o libUGM_Incus_InternalFuncs.so -buildmode=c-shared . || die
	cd "${S}" || die
	uimgui_src_compile
}
