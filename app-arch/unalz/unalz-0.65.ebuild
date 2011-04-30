# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Uncompress alz files"
HOMEPAGE="http://www.kippler.com/win/unalz/"
SRC_URI="http://www.kippler.com/win/unalz/${P}.tgz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_compile() {
	emake linux-utf8 || die "emake failed"
}

src_install() {
	dobin unalz || die
}

