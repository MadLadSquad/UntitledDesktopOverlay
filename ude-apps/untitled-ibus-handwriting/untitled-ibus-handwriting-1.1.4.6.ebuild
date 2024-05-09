# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit uimgui

DESCRIPTION="A handwriting recognition input method plugin for ibus"
HOMEPAGE="https://github.com/MadLadSquad/UntitledIBusHandwriting"
SRC_URI="https://github.com/MadLadSquad/UntitledImGuiFramework/releases/download/v0.8.7.9/untitled-imgui-framework.tar.xz -> untitled-imgui-framework.tar.xz 
https://github.com/MadLadSquad/UntitledIBusHandwriting/releases/download/v1.1.4.6/untitled-ibus-handwriting.tar.xz -> untitled-ibus-handwriting.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT=""

BDEPEND=""
DEPEND=""
RDEPEND="app-i18n/ibus
virtual/rust"
