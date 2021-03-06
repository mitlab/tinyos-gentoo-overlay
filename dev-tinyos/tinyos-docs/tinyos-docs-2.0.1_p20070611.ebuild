# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
inherit eutils

DESCRIPTION="TinyOS docs: documentation for Tinyos "
HOMEPAGE="http://www.tinyos.net/"
SRC_URI="http://www.naurel.org/stuff/${P}.tar.gz"
LICENSE="Intel"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND=">=dev-python/docutils-0.3.9"
RDEPEND=""
PDEPEND="dev-tinyos/nesc"

S=${WORKDIR}/${PN}-${PVR}
src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_compile() {
	emake || die "Failed to build "
	einfo "FIXME, should compile the docs "
}

src_install() {
	local TOSROOT=/usr/src/tinyos-2.x
	insinto ${TOSROOT}/doc
	doins -r html
	doins -r stylesheets
	doins -r pdf
	doins -r txt
	doins -r policy
	doins index.html
}

pkg_postinst(){
	einfo "Tinyos-2 docs are avaialable at  ${TOSROOT}/doc"
}
