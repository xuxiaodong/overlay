# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit mercurial

DESCRIPTION="surf is a simple web browser based on WebKit/GTK+."
HOMEPAGE="http://surf.suckless.org/"
EHG_REPO_URI="http://hg.suckless.org/surf"

EAPI="2"
LICENSE="MIT/X"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="x11-libs/gtk+
	net-libs/webkit-gtk"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_prepare() {
	cd "${S}"

	sed -i -e "s:/usr/local:/usr:" "${S}/config.mk"
}

src_compile() {
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}
