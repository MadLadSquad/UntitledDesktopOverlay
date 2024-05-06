# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Cross-platform desktop application framework based on the dear imgui library"
HOMEPAGE="https://github.com/MadLadSquad/UntitledImGuiFramework"
SRC_URI="https://github.com/MadLadSquad/UntitledImGuiFramework/releases/download/v0.8.7.8.4/untitled-imgui-framework.tar.xz -> untitled-imgui-framework.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT=""

BDEPEND=""
DEPEND=""
RDEPEND="dev-cpp/yaml-cpp
	dev-libs/utfcpp
	dev-util/vulkan-headers
	media-libs/vulkan-layers
	media-libs/vulkan-loader
	media-libs/glfw
	media-libs/glew
	media-libs/freetype
	media-libs/fontconfig
	sys-apps/dbus
	ude-base/untitled-cli-parser
	ude-base/untitled-exec
	ude-base/untitled-i18n
	ude-base/untitled-open
	ude-base/untitled-xdg-basedir"

S="${WORKDIR}"

src_compile() {
	# Compile build tool
	./install.sh ci || die

	# Generate and compile example project
	./create-project.sh ebuild || die

	# Configure for production
	sed -i "s/build-mode-vendor: true/build-mode-vendor: false/g" "${S}"/Projects/ebuild/uvproj.yaml
	echo "system-wide: true" >> "${S}"/Projects/ebuild/uvproj.yaml
	echo "install-framework: true" >> "${S}"/Projects/ebuild/uvproj.yaml
}

src_install() {
	cd UVKBuildTool/build || die
	# Export application for production
	./UVKBuildTool --build "${ED}"/usr ../../Projects/ebuild || die

	# Delete uneeded files
	rm "${ED}"/usr/lib64/libebuildLib.so "${ED}"/usr/bin/ebuild || die
	rm -rf "${ED}"/usr/share/utf8cpp "${ED}"/usr/include/utf8cpp "${ED}"/usr/etc/ebuild/ "${ED}"/usr/share/config/ebuild/ "${ED}"/usr/include/ebuild || die
}