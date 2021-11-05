# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A dynamic tiling extension for KWin"
HOMEPAGE="https://github.com/Bismuth-Forge/bismuth"

SRC_URI="
	https://github.com/gikari/test-bismuth-ci/releases/download/v${PV}/build-artifacts.tar.gz -> ${P}-build-artifacts.tar.gz
	https://github.com/gikari/test-bismuth-ci/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"
IUSE=""

QTMIN=5.22.5
KFMIN=5.82.0

DEPEND=""
RDEPEND="
	${DEPEND}
	>=kde-plasma/kwin-${QTMIN}:5
	>=kde-frameworks/kcmutils-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kdeclarative-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
"

S="${WORKDIR}/test-bismuth-ci-3.0.0/src/kcm"

src_install() {
	cmake_src_install

	cd "${WORKDIR}/kwinscript"
	insinto /usr/share/kwin/scripts/bismuth
	doins -r contents
	doins metadata.desktop
}