# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils distutils

DESCRIPTION="Enhancements to the Python build system"
HOMEPAGE="http://packages.debian.org/sid/python-distutils-extra"
SRC_URI="http://ftp.de.debian.org/debian/pool/main/p/${PN}/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ia64 ~ppc"
IUSE=""

DEPEND=">=dev-lang/python-2.4
	 >=dev-util/intltool-0.35.5"
RDEPEND="${DEPEND}"

S="${WORKDIR}/debian"

src_install() {
	DOCS="doc/README doc/FAQ doc/setup.cfg.example doc/setup.py.example"
	distutils_src_install
}
