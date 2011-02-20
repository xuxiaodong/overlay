# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
inherit distutils

DESCRIPTION="Specto is a desktop application that will watch configurable events (such as website updates, emails, file and folder changes, system processes, etc) and then trigger notifications."
HOMEPAGE="http://specto.sourceforge.net/"
SRC_URI="http://specto.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-python/gnome-python
		dev-python/notify-python
		dev-python/dbus-python"

src_install() {
	distutils_src_install
}

     

