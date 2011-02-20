# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git

DESCRIPTION="A full-featured, pure-Python tiling window manager."
HOMEPAGE="http://www.qtile.org/"
#SRC_URI="http://www.qtile.org/download/${P}.tar.gz"
EGIT_REPO_URI="git://github.com/cortesi/qtile.git"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-python/python-xlib"
RDEPEND="${DEPEND}"

src_install () {
	python setup.py install --prefix=/usr --root="${D}"
	assert "setup.py install failed"
}
