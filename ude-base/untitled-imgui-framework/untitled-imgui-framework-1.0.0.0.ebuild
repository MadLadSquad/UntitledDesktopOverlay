# Distributed under the terms of the MIT License

EAPI="7"

DESCRIPTION="Cross-platform desktop application framework based on the dear imgui library"
HOMEPAGE="https://github.com/MadLadSquad/UntitledImGuiFramework"
SRC_URI="$HOMEPAGE/releases/download/v${PV}/${P}.tar.xz -> ${P}.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT=""

BDEPEND="virtual/pkgconfig
	dev-cpp/yaml-cpp
	dev-libs/utfcpp
	dev-util/vulkan-headers
	media-libs/vulkan-layers
	media-libs/vulkan-loader
	media-libs/glfw
	media-libs/freetype
	media-libs/fontconfig
	ude-base/untitled-dbus-utils
	ude-base/untitled-cli-parser
	ude-base/untitled-exec
	ude-base/untitled-i18n
	ude-base/untitled-open
	ude-base/untitled-xdg-basedir"
DEPEND=""
RDEPEND="$BDEPEND"

src_compile() {
	sed -i "s/lib\/pkgconfig/lib64\/pkgconfig/g" "${S}"/UVKBuildTool/Templates/UntitledImGuiFramework/BuildFiles/CMakeInstall.tmpl || die
	# Compile build tool
	./install.sh ci || die

	# Generate and compile example project
	./create-project.sh ebuild --skip-compilation || die

	# Configure for production
	sed -i "s/build-mode-vendor: true/build-mode-vendor: false/g" "${S}"/Projects/ebuild/uvproj.yaml
	echo "system-wide: true" >> "${S}"/Projects/ebuild/uvproj.yaml
	echo "install-framework: true" >> "${S}"/Projects/ebuild/uvproj.yaml
}

src_install() {
	cd UVKBuildTool/build || die
	# Export application for production
	./UVKBuildTool --build "${ED}"/usr /usr ../../Projects/ebuild || die

	# Delete uneeded files
	rm "${ED}"/usr/lib64/libebuildLib.so "${ED}"/usr/bin/ebuild || die
	rm -rf "${ED}"/usr/share/utf8cpp "${ED}"/usr/include/utf8cpp "${ED}"/usr/share/config/ebuild/ "${ED}"/usr/include/ebuild || die

	cd ../ || die
	rm -rf build && mkdir build && cd build
	cmake .. -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=RELEASE -DUBT_INSTALL=ON -DCMAKE_INSTALL_PREFIX="/usr/" -DUBT_FRAMEWORK_DIR="/usr/include/UntitledImGuiFramework/" -DUBT_DATA_INSTALL_PREFIX="/usr/share" || die
	make -j "$(grep -c processor /proc/cpuinfo)" || die
	cmake --install . --prefix="${ED}/usr/" || die
}
