# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="EHUELS"
MODULE_VERSION="0.100.0"

inherit perl-module

DESCRIPTION="PostgreSQL Database Management Facilities for PGObject"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Test-Exception
	dev-perl/DBD-Pg
	dev-perl/DBI
	dev-perl/Capture-Tiny
	dev-perl/Moo
	dev-lang/perl"
