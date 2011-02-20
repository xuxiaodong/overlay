# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils flag-o-matic subversion

EAPI="2"

DESCRIPTION="Advanced color picker written in C++ using GTK+ toolkit."
HOMEPAGE="http://code.google.com/p/gpick/"

ESVN_REPO_URI="http://gpick.googlecode.com/svn/trunk/"
ESVN_PROJECT="gpick"

LICENSE="New BSD License"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="" #debug

RESTICT="primaryuri"

RDEPEND=">=x11-libs/gtk+-2.6"

DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.9.0"
#	app-text/dvipdfm
#	virtual/latex-base

S="${WORKDIR}/gpick"

src_unpack() {
	subversion_src_unpack
}

src_compile() {
	#chmod +x autogen.sh
	#./autogen.sh
	#econf || die "econf failed"
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
	#dodoc AUTHORS NEWS README THANKS
}
