# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils multilib toolchain-funcs

DESCRIPTION="LuaSocket is the most comprehensive networking support library for
the Lua language. It provides easy access to TCP, UDP, DNS, SMTP, FTP, HTTP,
MIME and much more."
HOMEPAGE="http://www.tecgraf.puc-rio.br/~diego/professional/luasocket/"
SRC_URI="http://luaforge.net/frs/download.php/2664/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND=">=dev-lang/lua-5.1"
RDEPEND=""

pkg_setup() {
	if ! built_with_use dev-lang/lua deprecated; then
		eerror "Please re-emerge dev-lang/lua with the deprecated USE flag"
		die "Missing deprecated USE flag on dev-lang/lua."
	fi
}

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -i \
		-e "s|/usr/local|\$(PREFIX)|g" \
		-e "s|/lib|/$(get_libdir)|g" \
		-e "s|-O2|${CFLAGS}|" \
		-e "s|gcc|$(tc-getCC)|" \
		config || die
	use debug || sed -i -e '/^DEF=-DLUASOCKET_DEBUG/d' config || die
}

src_install() {
	emake PREFIX="${D}usr" install || die
	dodoc NEW README
	dohtml doc/*
}
