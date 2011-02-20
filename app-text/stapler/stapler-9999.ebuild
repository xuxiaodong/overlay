# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git 

DESCRIPTION="Stapler is a pure python replacement for PDFtk, a tool for
manipulating PDF documents from the command line."
HOMEPAGE="http://github.com/hellerbarde/stapler"
EGIT_REPO_URI="git://github.com/hellerbarde/stapler.git"

EAPI="2"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-lang/python
	dev-python/pyPdf"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_unpack() {
	git_src_unpack

	cd "${S}"

	mv stapler.py stapler
}

src_install() {
	dobin stapler
	dodoc README LICENSE
}
