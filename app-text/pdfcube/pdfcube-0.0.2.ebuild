# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="PDF Cube uses the OpenGL API to add 3D spinning cube page transitions to PDF documents."
HOMEPAGE="http://code.100allora.it/pdfcube"
SRC_URI="mirror://debian/pool/main/p/pdfcube/${PN}_${PV}.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc"

DEPEND=">=app-text/poppler-bindings-0.5.4
	x11-libs/gtkglext"

pkg_setup() {
	if ! built_with_use app-text/poppler-bindings gtk; then
		einfo "Please re-emerge app-text/poppler-bindings with the gtk USE flag set"
		die "poppler-bindings needs gtk flag set"
	fi
}

src_install() {
	dobin src/pdfcube || die "cannot install pdfcube"
}
