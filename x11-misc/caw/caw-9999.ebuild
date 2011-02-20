# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils python git

DESCRIPTION="CAW is a easily customizable taskbar written in Python."
HOMEPAGE="http://github.com/decurtis/caw/"
EGIT_REPO_URI="git://github.com/decurtis/caw.git"

EAPI="2"
LICENSE="|| ( MPL-1.1 GPL-2 LGPL-2.1 )"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="x11-libs/libxcb
	x11-proto/xcb-proto
	x11-libs/xcb-util
	x11-libs/xpyb
	x11-libs/cairo
	x11-libs/pango"
RDEPEND="${DEPEND}"

src_unpack() {
	git_src_unpack
}

#src_compile() {
#	python setup.py build
#}

#src_install() {
#	python setup.py install
#}
