# Distributed under the terms of the MIT License

# @ECLASS: uimgui.eclass
# @MAINTAINER: contact@madladsquad.com
# @AUTHOR:
# MadLadSquad <contact@madladsquad.com>
# Stanislav Vasilev(Madman10K) <contact@i-use-gentoo-btw.com>, <stanislav.vasilev@madladsquad.com>
# @SUPPORTED_EAPIS: 7, 8
# @BLURB: Common ebuild functions for UntitledImGuiFramework applications
# @DESCRIPTION:
# The uimgui eclass makes creating ebuilds for applications that use the UntitledImGuiFramework
# much easier. It provides a compilation and installation functions

case ${EAPI} in
	7);;
	8);;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

RDEPEND+="ude-base/untitled-imgui-framework"

# @FUNCTION: uimgui_src_unpack
# @DESCRIPTION: Unpacks the framework
uimgui_src_unpack() {
	unpack "${A}"
}

# @FUNCTION: uimgui_src_compile
# @DESCRIPTION: Compile build tool and generate project
uimgui_src_compile() {
	cd "${S}" || die

	UVKBuildTool --generate "${S}" || die

	# Configure for production
	sed -i "s/build-mode-vendor: true/build-mode-vendor: false/g" "${S}"/uvproj.yaml
	sed -i "s/install-framework: true/install-framework: false/g" "${S}"/uvproj.yaml
	echo "install-framework: false" >> "${S}"/uvproj.yaml
}

# @FUNCTION: uimgui_src_install
# @DESCRIPTION: Build application and install it
uimgui_src_install() {
	UVKBuildTool --build "${ED}"/usr /usr "${S}" || die

	# Delete uneeded files
	rm -rf "${ED}"/usr/share/utf8cpp "${ED}"/usr/include/utf8cpp "${ED}"/share/utf8cpp "${ED}"/include/utf8cpp || die
}

EXPORT_FUNCTIONS src_unpack src_compile src_install
