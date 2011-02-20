# Distributed under the terms of the GNU General Public License v2
# Changes for cmake by ph0b 2009
 
inherit git
 
DESCRIPTION="Portable and multi-interface IRC client."
HOMEPAGE="http://weechat.flashtux.org/"
EGIT_REPO_URI="git://git.sv.gnu.org/weechat.git"
LICENSE="GPL-3"
 
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~x86-fbsd"
IUSE="perl python ruby ssl lua tcl spell"
 
RDEPEND="sys-libs/ncurses
	virtual/libiconv
	perl? ( dev-lang/perl )
	python? ( virtual/python )
	ruby? ( dev-lang/ruby )
	lua? ( >=dev-lang/lua-5.0 )
	ssl? ( net-libs/gnutls )
	spell? ( app-text/aspell )
	tcl? ( >=dev-lang/tcl-8.4.15 )"
DEPEND="${RDEPEND}
	>=dev-util/cmake-2.4.6
	nls? ( >=sys-devel/gettext-0.15 )"
 
RDEPEND="${DEPEND}"
 
pkg_setup() {
	if ! built_with_use --missing true dev-lang/lua deprecated; then
		eerror "To build ${PN} you need the deprecated functions for lua."
		eerror "Please enable the deprecated USE flag for dev-lang/lua."
		die "Missing Lua deprecated functions."
	fi
}
src_compile() {
	myconf="-DCMAKE_INSTALL_PREFIX=/usr -DENABLE_GTK=OFF"
	use perl   || myconf+=" -DDISABLE_PERL=ON"
	use python || myconf+=" -DDISABLE_PYTHON=ON"
	use ruby   || myconf+=" -DDISABLE_RUBY=ON"
	use lua    || myconf+=" -DDISABLE_LUA=ON"
	use spell  || myconf+=" -DDISABLE_ASPELL=ON"
	use ssl    || myconf+=" -DDISABLE_GNUTLS=ON"
	use tcl    || myconf+=" -DDISABLE_TCL=ON"
 
	LDFLAGS="${LDFLAGS}" cmake ${myconf} \
	-DCMAKE_C_COMPILER=$(type -P $(tc-getCC)) \
	-DCMAKE_CXX_COMPILER=$(type -P $(tc-getCXX)) \
	-DCMAKE_CXX_FLAGS="-DQT_THREAD_SUPPORT" \
	-DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
	-DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
	|| die "cmake failed"
 
	emake || die "emake failed"
}
 
src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS ChangeLog NEWS README || die "dodoc failed"
}
