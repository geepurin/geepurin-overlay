# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils gnome2-utils autotools

DESCRIPTION="Simple timer application using gtk+"
HOMEPAGE="http://happytimer.kldp.net/projects/happytimer/"
SRC_URI="http://kldp.net/frs/download.php/5988/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/gtk+:3
	>=media-libs/gstreamer-0.10
	dev-libs/mini-xml
	x11-libs/libnotify"

DEPEND="${RDEPEND}
	dev-util/pkgconfig
	sys-devel/gettext"

src_prepare() {
	epatch "${FILESDIR}"/${PV}-makefile.patch
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc README COPYING AUTHORS ChangeLog INSTALL NEWS
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
