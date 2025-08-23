# Distributed under the terms of the MIT License

EAPI="7"

inherit uimgui go-module

DESCRIPTION="A manager for containerised Linux gaming systems based on Incus"
HOMEPAGE="https://github.com/MadLadSquad/UntitledGameSystemManager"
SRC_URI="$HOMEPAGE/releases/download/v$PV/$P.tar.xz -> $P.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT=""

BDEPEND="dev-lang/go
	app-containers/incus"
DEPEND=""
RDEPEND="app-containers/incus"

src_unpack() {
	uimgui_src_unpack
}

src_compile() {
	cd IncusBindings/ || die
	go build -mod=vendor -o libUGM_Incus_InternalFuncs.so -buildmode=c-shared . || die
	cd .. || die
	uimgui_src_compile
}
