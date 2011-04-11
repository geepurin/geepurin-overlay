# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit multilib

DESCRIPTION="Simple uncompressor using Ark"
HOMEPAGE="http://www.indidev.net/forum/viewtopic.php?f=3&t=73"
SRC_URI="http://dl.dropbox.com/u/22149963/repo/unark-src.7z"

LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""

DEPEND="app-arch/p7zip"
RDEPEND=""

S=${WORKDIR}/${PN}-src

QA_PRESTRIPPED="
	opt/unark/ark32.so
"

QA_TEXTRELS="
	opt/unark/ark32.so
"

DEST=/opt/unark

pkg_setup() {
	has_multilib_profile && ABI="x86"
}

src_prepare() {
	sed -i -e 's/".\/ark32.so"/"\/opt\/unark\/ark32.so"/' include/ArkLib.h || die "Sed failed!"
}

src_compile() {
	cd unark
	if use amd64; then
		g++ -m32 ${CXXFLAGS} main.cpp -o unark -ldl || die "Compile failed!"
	else
		g++ ${CXXFLAGS} main.cpp -o unark -ldl || die "Compile failed!"
	fi
}

src_install() {
	dodir ${DEST} || die
	insinto ${DEST}
	doins bin/ArkLicense.txt || die

	exeinto ${DEST}
	doexe bin/ark32.so unark/unark || die

	dodir /opt/bin || die
	dosym ../unark/unark /opt/bin/unark || die
}
