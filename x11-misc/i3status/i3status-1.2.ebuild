# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#MY_P="${PN}-3.b"

DESCRIPTION="Generates status bar to use with dzen2 or wmii"
HOMEPAGE="http://code.stapelberg.de/git/i3status/"
SRC_URI="http://code.stapelberg.de/git/i3status/snapshot/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}/${P}"

src_compile() {
	emake || die "emake failed"
#	emake -C man || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
#	dodoc GOALS TODO || die "dodoc ${PN} failed"

#	doman man/${PN}.1 || die "doman ${PN} failed"

#	echo -e "#!/bin/sh\n/usr/bin/${PN}" > "${T}/${PN}"
#	exeinto /etc/X11/Sessions
#	doexe "${T}/${PN}" || die "doexe ${PN} failes"
}
