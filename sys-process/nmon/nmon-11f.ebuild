# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Nigel's Monitor - provided by IBM"
HOMEPAGE="http://www.ibm.com/collaboration/wiki/display/WikiPtype/nmon"
SRC_URI="http://www.ibm.com/developerworks/wikis/download/attachments/53871937/${PN}_x86_${PV}.zip"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="app-arch/unzip"

S=${WORKDIR}

src_install() {
	newbin nmon_x86_debian31 nmon
}
