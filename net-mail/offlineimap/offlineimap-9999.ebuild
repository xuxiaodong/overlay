# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-mail/offlineimap/offlineimap-6.1.1.ebuild,v 1.1 2009/07/10 22:09:26 dertobi123 Exp $

EAPI=2

inherit git distutils

DESCRIPTION="Powerful IMAP/Maildir synchronization and reader support"
HOMEPAGE="http://software.complete.org/offlineimap"
EGIT_REPO_URI="git://github.com/jgoerzen/offlineimap.git"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="ssl"

DEPEND=""
RDEPEND="dev-lang/python[threads]
	ssl? ( dev-lang/python[ssl] ) "

src_unpack() {
	git_src_unpack
}

src_install() {
	distutils_src_install
	dodoc offlineimap.conf offlineimap.conf.minimal offlineimap.sgml
}

pkg_postinst() {
	elog ""
	elog "You will need to configure offlineimap by creating ~/.offlineimaprc"
	elog "Sample configurations are in /usr/share/doc/${P}/"
	elog ""
}
