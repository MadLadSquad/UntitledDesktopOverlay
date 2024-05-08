# Distributed under the terms of the GNU General Public License v2

# @ECLASS: uimgui.eclass
# @MAINTAINER: contact@madladsquad.com
# @AUTHOR:
# MadLadSquad <contact@madladsquad.com>
# Stanislav Vasilev(Madman10K) <contact@i-use-gentoo-btw.com>
# @SUPPORTED_EAPIS: 7
# @BLURB: Commond ebuild functions for UntitledImGuiFramework applications
# @DESCRIPTION:
# The uimgui eclass makes creating ebuilds for applications that use the UntitledImGuiFramework
# much easier. It provides a compilation and installation functions

case ${EAPI} in
	7);;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

RDEPEND+="ude-base/untitled-imgui-framework"
S="${WORKDIR}/UFW"

# @FUNCTION: uimgui_src_unpack
# @DESCRIPTION: Unpacks the framework
uimgui_src_unpack() {
	# Unpack framework
	unpack untitled-imgui-framework.tar.xz
	mkdir "${WORKDIR}"/UFW || die
	ls "${WORKDIR}" | grep -v "UFW" | xargs -i mv {} "${WORKDIR}"/UFW || die

	# Unpack project
	unpack "${PN}".tar.xz
	mkdir "${WORKDIR}"/"${PN}" || die
	ls "${WORKDIR}" | grep -v "UFW" | grep -v "${PN}" | xargs -i mv {} "${WORKDIR}"/"${PN}" || die
}

# @FUNCTION: uimgui_src_compile
# @DESCRIPTION: Compile build tool and generate project
uimgui_src_compile() {
	# Compile build tool
	./install.sh ci || die

	# Move the project in place
	mv "${WORKDIR}"/"${PN}" "${S}"/Projects/ || die

	# Create required links and directories
	mkdir "${S}"/Projects/"${PN}"/Generated || die
	ln -rs "${S}"/Framework "${S}"/Projects/"${PN}"/Framework || die
	ln -rs "${S}"/Framework "${S}"/Projects/"${PN}"/UVKBuildTool || die
	ln -rs "${S}"/"export.sh" "${S}"/Projects/"${PN}"/"export.sh" || die
	mkdir "${S}"/Projects/"${PN}"/Exported || die

	cd "${S}"/UVKBuildTool/build || die
	./UVKBuildTool --generate ../../Projects/"${PN}" || die

	# Configure for production
	sed -i "s/build-mode-vendor: true/build-mode-vendor: false/g" "${S}"/Projects/"${PN}"/uvproj.yaml
	sed -i "s/install-framework: true/install-framework: false/g" "${S}"/Projects/"${PN}"/uvproj.yaml
	echo "system-wide: true" >> "${S}"/Projects/"${PN}"/uvproj.yaml
}

# @FUNCTION: uimgui_src_install
# @DESCRIPTION: Build application and install it
uimgui_src_install() {
	cd "${S}"/UVKBuildTool/build || die
	# Export application for production
	./UVKBuildTool --build "${ED}"/usr /usr ../../Projects/"${PN}" || die

	# Delete uneeded files
	rm -rf "${ED}"/usr/share/utf8cpp "${ED}"/usr/include/utf8cpp "${ED}"/share/utf8cpp "${ED}"/include/utf8cpp || die
}

EXPORT_FUNCTIONS src_unpack src_compile src_install
