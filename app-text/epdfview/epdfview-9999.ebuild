inherit eutils subversion

DESCRIPTION="Lightweight PDF viewer using Poppler and GTK+ libraries."
HOMEPAGE="http://trac.emma-soft.com/epdfview/"
KEYWORDS="amd64 ppc ppc64 sparc x86"
IUSE="cups nls test"
SLOT="0"
LICENSE="GPL-2"

ESVN_REPO_URI="svn://svn.emma-soft.com/${PN}/trunk"

COMMON_DEPEND="!>=app-text/poppler-bindings-0.5.0
	>=x11-libs/gtk+-2.6
	cups? ( >=net-print/cups-1.1 )"
DEPEND="${COMMON_DEPEND}
	>=dev-util/pkgconfig-0.9
	nls? ( sys-devel/gettext )
	test? ( dev-util/cppunit )"
RDEPEND="${COMMON_DEPEND}
	nls? ( virtual/libintl )"

S="${WORKDIR}/${PN}-${PV}"

#pkg_setup() {
#	if ! built_with_use app-text/poppler-bindings gtk; then
#		eerror "Please re-emerge app-text/poppler-bindings with the gtk USE flag set."
#		die "poppler-bindings needs gtk flag set."
#	fi
#}

src_unpack() {
	subversion_src_unpack
}

src_compile() {
	./autogen.sh
	econf \
		$(use_enable cups) \
		$(use_with nls) \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS NEWS README THANKS
}
