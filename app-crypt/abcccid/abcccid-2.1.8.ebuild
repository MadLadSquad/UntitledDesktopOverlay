# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit udev

DESCRIPTION="AB Circle CCID card reader driver"
HOMEPAGE="https://www.abcircle.com/en/"
SRC_URI="https://github.com/invakid404/abcccid/releases/download/2.1.8/Circle_Linux_Mac_Driver_v2.1.8.zip -> Circle_Linux_Mac_Driver_v2.1.8.zip"

LICENSE="LGPL-2"
KEYWORDS="*"
SLOT="0"

DEPEND="virtual/linux-sources"
BDEPEND="sys-apps/pcsc-lite
	virtual/pkgconfig
	dev-libs/opensc"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}"/Circle_* "tmp"
	unpack "${WORKDIR}"/tmp/"${P}".tar.bz2
}

src_install() {
	default
	udev_dorules "${S}"/src/92_pcscd_abcccid.rules
}