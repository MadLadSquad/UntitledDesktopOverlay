# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit desktop rpm xdg

DESCRIPTION="Browser Independent Signing Service by Borika for signing files with a QES"
HOMEPAGE="https://www.b-trust.bg/services/software"
SRC_URI="https://www.b-trust.bg/attachments/BtrustPrivateFile/146/docs/B-TrustBISS.tar"

LICENSE="EULA"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT=""

BDEPEND=""
DEPEND=""
RDEPEND=""

S="${WORKDIR}"

src_unpack() {
	unpack "${A}"
	rpm_unpack ./"${P}"-*.rpm
}

src_install() {
	default

	doicon opt/btrustbiss/lib/BISS.png
	domenu opt/btrustbiss/lib/btrustbiss-BISS.desktop

	insinto /opt/btrustbiss
	doins -r opt/btrustbiss/.

	fperms +x ${ED}/opt/btrustbiss/bin/BISS
	fperms 775 ${ED}/opt/btrustbiss/lib/runtime/lib/*.so
	fperms 775 ${ED}/opt/btrustbiss/lib/runtime/lib/jexec
	fperms 775 ${ED}/opt/btrustbiss/lib/runtime/lib/jspawnhelper
	dosym ${ED}/opt/btrustbiss/bin/BISS usr/bin/BISS
}

pkg_postinst() {
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
	xdg_desktop_database_update
}
