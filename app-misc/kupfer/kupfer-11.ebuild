# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit 

MY_P="${PN}-c${PV}"
DESCRIPTION="A convenient command and access tool."
HOMEPAGE="http://kaizer.se/wiki/kupfer/"
SRC_URI="http://kaizer.se/publicfiles/kupfer/${MY_P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-lang/python
	dev-python/dbus-python
	dev-python/pyxdg"

RDEPEND="${DEPEND}"

src_compile() {
	cd ${MY_P}
	./waf configure --prefix=/usr
	./waf
}

src_install() {
	cd ${MY_P}
	./waf install
}
