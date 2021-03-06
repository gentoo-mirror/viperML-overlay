# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A material Design theme for GTK"
HOMEPAGE="https://github.com/vinceliuice/Orchis-theme"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
else
	MY_PV="${PV//./-}"
	MY_P="${PN}-${MY_PV}"
	SRC_URI="${HOMEPAGE}/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	x11-libs/gtk+:3
	x11-themes/gnome-themes-standard
	x11-themes/gtk-engines
	x11-themes/gtk-engines-murrine
	dev-lang/sassc"

RDEPEND="${DEPEND}"

src_install() {
	mkdir -p "${ED}"/usr/share/themes
	./install.sh -d "${ED}"/usr/share/themes || die
}