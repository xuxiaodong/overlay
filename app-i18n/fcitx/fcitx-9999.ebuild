# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="http://fcitx.googlecode.com/svn/trunk"

inherit autotools subversion

DESCRIPTION="Free Chinese Input Toy for X. Another Chinese XIM Input Method"
HOMEPAGE="http://fcitx.googlecode.com"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="xft"

RDEPEND="x11-libs/libX11
	x11-libs/libXpm
	x11-libs/libXrender
	x11-libs/libXt
	xft? ( x11-libs/libXft )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_unpack() {
	subversion_src_unpack

	# change homepage and version naming scheme
	sed -i \
		-e "s#\(3.5-\)[[:alnum:]]*#\1svn-r${ESVN_WC_REVISION}#" \
		configure.in
	sed -i \
		-e "s#http://www\.fcitx\.org#${HOMEPAGE}#" \
		src/InputWindow.c
	eautoreconf
}

src_compile() {
	econf $(use_enable xft) || die "configure failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"

	dodoc AUTHORS ChangeLog README THANKS TODO

	# Remove empty directory
	rmdir "${D}"/usr/share/fcitx/xpm

	rm -rf "${D}"/usr/share/fcitx/doc/
	dodoc doc/pinyin.txt doc/cjkvinput.txt
	dohtml doc/wb_fh.htm
}

pkg_postinst() {
	einfo "This is not an official release. Please report you bugs to:"
	einfo "http://code.google.com/p/fcitx/issues/list"
	echo
	elog "You should export the following variables to use fcitx"
	elog " export XMODIFIERS=\"@im=fcitx\""
	elog " export XIM=fcitx"
	elog " export XIM_PROGRAM=fcitx"
	echo
}
