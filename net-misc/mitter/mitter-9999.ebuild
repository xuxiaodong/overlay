# Distributed under the terms of the GNU General Public License v2
# Author: Julio Biason 
# Author-email: julio@juliobiason.net
# License: GPL3
inherit distutils python git

EGIT_REPO_URI="git://github.com/albert748/hacking-mitter.git"

DESCRIPTION="Mitter is a python / gtk twitter client"
HOMEPAGE="http://code.google.com/p/mitter/"
SRC_URI=""

KEYWORDS="-* ~x86 ~amd64 ~ppc"
SLOT="0"
LICENSE="GPL-2"
IUSE="pygtk"

RDEPEND="dev-lang/python
	dev-python/simplejson
	pygtk? ( dev-python/pygtk )"

DEPEND="${RDEPEND}"

src_unpack() {
	git_src_unpack
}
