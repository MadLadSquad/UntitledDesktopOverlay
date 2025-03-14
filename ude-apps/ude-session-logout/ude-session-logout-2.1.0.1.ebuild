# Distributed under the terms of the MIT License

EAPI="7"

inherit uimgui

DESCRIPTION="A log out prompt for the UntitledDesktopEnvironment"
HOMEPAGE="https://github.com/MadLadSquad/UntitledDESessionLogout"
SRC_URI="$HOMEPAGE/releases/download/v$PV/$P.tar.xz -> $P.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT=""

BDEPEND="sys-auth/elogind"
DEPEND=""
RDEPEND="$BDEPEND"
