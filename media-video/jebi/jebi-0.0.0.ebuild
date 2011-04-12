# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Clutter Tutorial"
HOMEPAGE="http://geepurin.net"
SRC_URI="http://dl.dropbox.com/u/22149963/repo/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=media-libs/clutter-1.6.0"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_configure() {
	econf
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
