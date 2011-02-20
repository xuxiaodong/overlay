# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="A minimal word processor that lets you focus on writing"
HOMEPAGE="http://pyroom.org/"
SRC_URI="http://launchpad.net/${PN}/0.3/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-python/pygtksourceview"
DEPEND="${RDEPEND}"

DOCS="AUTHORS CHANGELOG"
