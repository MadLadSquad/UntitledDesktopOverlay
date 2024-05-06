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

# @ECLASS_VARIABLE: UIMGUI_PROJECT_ARCHIVE_NAME
# @PRE_INHERIT
# @DEFAULT_UNSET
# @DESCRIPTION: specify the name of the project archive
: "${UIMGUI_PROJECT_ARCHIVE_NAME}"

RDEPEND+="untitled-imgui-framework"
S="${WORKDIR}"

# @FUNCTION: uimgui_src_unpack
# @DESCRIPTION: Unpacks the framework
uimgui_src_unpack() {
	# Unpack framework
	unpack untitled-imgui-framework.tar.xz
}

# @FUNCTION: uimgui_src_compile
# @DESCRIPTION: Compile build tool and generate project
uimgui_src_compile() {
	# Compile build tool
	./install.sh ci || die

	# TODO: Unpack project archive here
	(cd Projects/ && mkdir "${PN}" && cd "${PN}" && unpack "${UIMGUI_PROJECT_ARCHIVE_NAME}" && cd ../../) || die

	cd UVKBuildTool/build || die
	./UVKBuildTool --generate ../../Projects/"${PN}" || exit

	# Configure for production
	sed -i "s/build-mode-vendor: true/build-mode-vendor: false/g" "${S}"/Projects/"${PN}"/uvproj.yaml
	echo "system-wide: true" >> "${S}"/Projects/"${PN}"/uvproj.yaml
}

# @FUNCTION: uimgui_src_install
# @DESCRIPTION: Build application and install it
uimgui_src_install() {
	cd UVKBuildTool/build || die
	# Export application for production
	./UVKBuildTool --build "${ED}"/usr ../../Projects/"${PN}" || die

	# Delete uneeded files
	rm -rf "${ED}"/usr/share/utf8cpp "${ED}"/usr/include/utf8cpp || die
}

EXPORT_FUNCTIONS uimgui_src_unpack uimgui_src_compile uimgui_src_install
