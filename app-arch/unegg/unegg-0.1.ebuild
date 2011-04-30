# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MY_PV="1.0"

DESCRIPTION="Uncompress egg files"
HOMEPAGE="http://www.altools.co.kr/Product/ALZip_Intro.aspx"
SRC_URI="http://sdn.altools.co.kr/etc/UnEgg(Linux)_${MY_PV}.zip"

LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"

S="${WORKDIR}/build"

src_compile() {
	emake || die "emake failed"
}

src_install() {
	dobin unegg || die
}
