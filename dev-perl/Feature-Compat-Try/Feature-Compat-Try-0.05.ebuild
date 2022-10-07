# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# This ebuild generated by g-cpan 0.17.0

EAPI=8

DIST_AUTHOR="PEVANS"
DIST_VERSION="0.05"


inherit perl-module

DESCRIPTION="C<Feature::Compat::Try> - make C<try/catch> syntax available"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Module-Build
	>=dev-perl/Syntax-Keyword-Try-0.270.0
	dev-lang/perl"
