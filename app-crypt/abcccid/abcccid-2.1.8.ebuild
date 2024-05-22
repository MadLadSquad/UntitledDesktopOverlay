# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="AB Circle CCID card reader driver"
HOMEPAGE="https://www.abcircle.com/en/"
SRC_URI="https://github.com/invakid404/abcccid/releases/download/2.1.8/Circle_Linux_Mac_Driver_v2.1.8.zip -> Circle_Linux_Mac_Driver_v2.1.8.zip"

LICENSE="LGPL-2"
KEYWORDS="*"

DEPEND="virtual/linux-sources"
BDEPEND="sys-apps/pcsc-lite
	virtual/pkgconfig"

src_unpack() {
	unpack ${A}
	die
}