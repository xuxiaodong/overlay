# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils flag-o-matic subversion

EAPI="2"

DESCRIPTION="apvlv is a PDF Viewer which behavior like Vim"
HOMEPAGE="http://code.google.com/p/apvlv/"

ESVN_REPO_URI="http://apvlv.googlecode.com/svn/trunk"
ESVN_PROJECT="apvlv"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="" #debug

RESTICT="primaryuri"

RDEPEND=">=x11-libs/gtk+-2.6
	>=dev-libs/poppler-0.5.4"
DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.9.0"
#	app-text/dvipdfm
#	virtual/latex-base

S="${WORKDIR}/apvlv"

src_unpack() {
	subversion_src_unpack
}

src_compile() {
	chmod +x autogen.sh
	./autogen.sh
	econf || die "econf failed"
	emake || die "emake failed"
}

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
