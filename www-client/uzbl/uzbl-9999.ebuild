# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git multilib

DESCRIPTION="A keyboard controlled browser based on Webkit."
HOMEPAGE="http://www.uzbl.org"
EGIT_REPO_URI="git://github.com/Dieterbe/uzbl.git"
EGIT_BRANCH="experimental"
EGIT_TREE="experimental"

EAPI="2"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="x11-libs/gtk+
	net-libs/webkit-gtk"
RDEPEND="${DEPEND}"

#S="${WORKDIR}/${PN}"

#src_unpack() {
#	git_src_unpack
	
#	cd "${S}"
src_prepare() {
	sed -i -e "s:/usr/local:/usr:" Makefile
	#sed -i -e "107s/^/#/" Makefile
}

src_compile() {
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc AUTHORS README 
}
