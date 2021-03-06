# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EBZR_BRANCH="trunk"
EBZR_REPO_URI="https://code.launchpad.net/~gwibber-committers/gwibber/"
inherit bzr

DESCRIPTION="Gwibber is an open source microblogging client for GNOME developed with Python and GTK. It supports Twitter, Jaiku, Identi.ca, Facebook, and Digg."
HOMEPAGE="https://launchpad.net/gwibber"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-python/dbus-python-0.80.2
	>=dev-python/gconf-python-2.18.0
	>=dev-python/pygtk-2.10.4
	>=dev-python/notify-python-0.1.1
	dev-python/egenix-mx-base
	dev-python/feedparser
	>=dev-python/simplejson-1.7.3
	>=dev-python/python-distutils-extra-1.91
	net-libs/webkit-gtk
	>=dev-python/pywebkitgtk-1.0.2"

RDEPEND="${DEPEND}"

src_compile() {
	cd "${S}"
	python setup.py config
	python setup.py build || die "setup.py build failed"
}

src_install () {
	python setup.py install --prefix=/usr --root="${D}"
	assert "setup.py install failed"
}

