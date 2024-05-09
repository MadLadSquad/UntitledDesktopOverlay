# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit uimgui

DESCRIPTION="A log out prompt for the UntitledDesktopEnvironment"
HOMEPAGE="https://github.com/MadLadSquad/UntitledDESessionLogout"
SRC_URI="https://github.com/MadLadSquad/UntitledImGuiFramework/releases/download/v0.8.7.9/untitled-imgui-framework.tar.xz -> untitled-imgui-framework.tar.xz
https://github.com/MadLadSquad/UntitledDESessionLogout/releases/download/v1.5.4.6/ude-session-logout.tar.xz -> ude-session-logout.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT=""

BDEPEND=""
DEPEND=""
RDEPEND="sys-auth/elogind"
