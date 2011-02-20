# Copyright 2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs savedconfig git

EGIT_REPO_URI="git://repo.or.cz/dvtm.git"

DESCRIPTION="Dynamic virtual terminal manager"
HOMEPAGE="http://www.brain-dump.org/projects/dvtm/"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND=${DEPEND}

src_unpack() {
	git_src_unpack

	sed -i \
		-e "s/CFLAGS = -Os/CFLAGS += -g/" \
		-e "s/LDFLAGS = -s/LDFLAGS += -g/" \
		config.mk || die "sed failed"
	sed -i \
		-e "s/@strip -s dvtm//" \
		Makefile || die "sed Makefile failed"

	if use savedconfig; then
		restore_config config.h
	fi
}

src_compile() {
	local msg
	use savedconfig && msg=", please check the configfile"
	emake CC=$(tc-getCC) || die "emake failed${msg}"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install || die "emake install failed"

	insinto /usr/share/${PN}
	newins config.h ${PF}.config.h

	dodoc README

	save_config config.h
}

pkg_postinst() {
	einfo "This ebuild has support for user defined configs"
	einfo "Please read this ebuild for more details and re-emerge as needed"
	einfo "if you want to add or remove functionality for ${PN}"
}
