# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
inherit distutils git

DESCRIPTION="Bookmark tools is a collection of useful shell commands and Python
scripts that aim to speed up navigation and organization in day to day work."
HOMEPAGE="http://www.bookmark-tools.com/"
EGIT_REPO_URI="git://bookmark-tools.com/btools.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"

src_install() {
	distutils_src_install
}
