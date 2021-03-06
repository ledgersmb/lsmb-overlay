# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="EHUELS"
MODULE_VERSION="0.11"

inherit perl-module

DESCRIPTION="Perl's php/Mink-inspired abstracted web-driver framework"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Module-Runtime
	dev-perl/Moose
	dev-lang/perl"
