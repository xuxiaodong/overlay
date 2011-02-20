# Copyright 2000-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils flag-o-matic subversion

DESCRIPTION="CoreAVC codec for Linux"
HOMEPAGE="http://coreavc-for-linux.googlecode.com"

ESVN_REPO_URI="http://coreavc-for-linux.googlecode.com/svn/trunk"
ESVN_PROJECT="coreavc-for-linux"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}"

S="${WORKDIR}/coreavc-for-linux"

src_unpack() {
	subversion_src_unpack
	cd ${S}
}

src_compile() {
	cd dshowserver
	emake || die "emake failed"
}

src_install() {
	dobin dshowserver/dshowserver dshowserver/registercodec
	doman man/{dshowserver.1,registercodec.1}
} 

pkg_postinst() {
    elog "Move CoreAVC to /usr/lib/win32/CoreAVCDecoder.ax"
    elog "and reemerge patched mplayer, xine or mythtv"
}

