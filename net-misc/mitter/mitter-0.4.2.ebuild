# Distributed under the terms of the GNU General Public License v2
# Author: Julio Biason 
# Author-email: julio@juliobiason.net
# License: GPL3
inherit distutils python

DESCRIPTION="Mitter is a python / gtk twitter client"
HOMEPAGE="http://code.google.com/p/mitter/"
SRC_URI="http://mitter.googlecode.com/files/${P}.tar.gz"

KEYWORDS="-* ~x86 ~amd64 ~ppc"
SLOT="0"
LICENSE="GPL-2"
IUSE="pygtk"

RDEPEND=">=dev-lang/python-2.5
	dev-python/simplejson
	pygtk? ( dev-python/pygtk )"

DEPEND="${RDEPEND}"


