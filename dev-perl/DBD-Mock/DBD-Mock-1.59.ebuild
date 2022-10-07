# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# This ebuild generated by g-cpan 0.17.0

EAPI=8

DIST_AUTHOR="JLCOOPER"
DIST_VERSION="1.59"

inherit perl-module

DESCRIPTION="Mock database driver for testing"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-perl/Module-Build-Tiny-0.39.0
	>=dev-perl/DBI-1.643.0
	>=dev-perl/Test-Exception-0.430.0
	dev-perl/Module-Build
	dev-lang/perl"