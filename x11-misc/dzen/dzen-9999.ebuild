# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion toolchain-funcs multilib

DESCRIPTION="a general purpose messaging, notification and menuing program for
X11."
HOMEPAGE="http://gotmor.googlepages.com/dzen"
SRC_URI=""
ESVN_REPO_URI="http://dzen.googlecode.com/svn/trunk/"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~x86"
IUSE="minimal xinerama +xpm"

DEPEND="x11-libs/libX11
	xinerama? ( x11-libs/libXinerama )
	xpm? ( x11-libs/libXpm )"
RDEPEND="${DEPEND}
	xinerama? ( x11-proto/xineramaproto )"

src_unpack() {
	subversion_src_unpack

	cd "${S}"
	sed -e "s:/usr/local:/usr:g" \
		-e "s:-Os:${CFLAGS}:g" \
		-e "/CC/s:gcc:$(tc-getCC):" \
		-e "s:/usr/lib :/usr/$(get_libdir):" \
		-i config.mk gadgets/config.mk || die "sed failed"
	sed -i -e "/strip/d" Makefile gadgets/Makefile || die "sed failed"
	if use xinerama ; then
		sed -e "/^LIBS/s/$/\ -lXinerama/" \
			-e "/^CFLAGS/s/$/\ -DDZEN_XINERAMA/" \
			-i config.mk || die "sed failed"
	fi
	if use xpm ; then
		sed -e "/^LIBS/s/$/\ -lXpm/" \
			-e "/^CFLAGS/s/$/\ -DDZEN_XPM/" \
			-i config.mk || die "sed failed"
	fi
}

src_compile() {
	emake || die "emake failed"

	if ! use minimal ; then
		cd "${S}"/gadgets
		emake || die "emake gadgets failed"
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README || die
	if ! use minimal ; then
		cd "${S}"/gadgets
		emake DESTDIR="${D}" install || die "emake gadgets install failed"
		dodoc README* || die
	fi
}
