# Distributed under the terms of the MIT License

EAPI="8"

CRATES=" "

inherit uimgui cargo

ECARGO_VENDOR="${S}/hanzi_lookup/vendor"

DESCRIPTION="A handwriting recognition input method plugin for ibus"
HOMEPAGE="https://github.com/MadLadSquad/UntitledIBusHandwriting"
SRC_URI="https://github.com/MadLadSquad/UntitledIBusHandwriting/releases/download/v1.3.0.0/untitled-ibus-handwriting.tar.xz -> untitled-ibus-handwriting.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT=""

BDEPEND="app-i18n/ibus
	virtual/rust"
DEPEND=""
RDEPEND="app-i18n/ibus"

src_unpack() {
	uimgui_src_unpack
}

src_configure() {
	default
}

src_compile() {
	cd "${S}"/hanzi_lookup || die
	cargo build --release || die
	cd "${S}" || die
	uimgui_src_compile
}

src_install() {
	uimgui_src_install
}
