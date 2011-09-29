# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="Simple timer application using gtk+"
HOMEPAGE="http://happytimer.kldp.net/projects/happytimer/"
SRC_URI="http://happytimer.kldp.net/frs/download.php/5985/${P}.tar.gz"

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
	epatch "${FILESDIR}"/${PV}-invalid-malloc.patch || die
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
