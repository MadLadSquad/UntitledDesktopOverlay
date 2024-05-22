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
	cp -r "${S}"/opt "${ED}"

	fperms +x /opt/btrustbiss/bin/BISS
	for f in "${S}"/opt/btrustbiss/lib/runtime/lib/*.so; do
		local name=$(basename "${f}")
		fperms 775 /opt/btrustbiss/lib/runtime/lib/"${name}"
	done
	fperms 775 /opt/btrustbiss/lib/runtime/lib/jexec
	fperms 775 /opt/btrustbiss/lib/runtime/lib/jspawnhelper
	
	doicon opt/btrustbiss/lib/BISS.png
	domenu opt/btrustbiss/lib/btrustbiss-BISS.desktop

	insinto /opt/btrustbiss
	doins -r /opt/btrustbiss/.

	dosym /opt/btrustbiss/bin/BISS usr/bin/BISS


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
