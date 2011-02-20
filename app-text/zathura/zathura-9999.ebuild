# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git savedconfig

DESCRIPTION="zathura is a highly customizable pdf viewer based on the poppler
pdf rendering library."
HOMEPAGE="http://zathura.neldoreth.net"
EGIT_REPO_URI="git://neldoreth.net/zathura.git"

EAPI="2"
LICENSE="ZLib"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="x11-libs/gtk+
	x11-libs/cairo
	dev-libs/poppler"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_unpack() {
	git_src_unpack

	cd "${S}"

	if use savedconfig; then
		restore_config config.h
	fi
}

src_compile() {
	local msg
	use savedconfig && msg=", please check the configfile"
	emake || die
}

src_install() {
	dobin zathura
	doman zathura.1

	insinto /usr/share/${PN}
	newins config.h ${PF}.config.h

	dodoc LICENSE

	save_config config.h
}

pkg_postinst() {
	einfo "This ebuild has support for user defined configs"
	einfo "Please read this ebuild for more details and re-emerge as needed"
	einfo "if you want to add or remove functionality for ${PN}"
}
