# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="apvlv is a PDF Viewer which behavior like Vim"
HOMEPAGE="http://code.google.com/p/apvlv/"
SRC_URI="http://apvlv.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="" #debug

RESTICT="primaryuri"

RDEPEND=">=x11-libs/gtk+-2.6
	>=app-text/poppler-0.5.4"
DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.9.0"
#	app-text/dvipdfm
#	virtual/latex-base

# TODO: debug
#src_configure() {
#	econf \
#		$(use_enable debug) \
#		--disable-dependency-tracking
#}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc AUTHORS NEWS README THANKS
}
