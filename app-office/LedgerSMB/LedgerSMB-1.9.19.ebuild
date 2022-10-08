# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An Accounting Application for Small to Midsized Businesses"

HOMEPAGE="https://ledgersmb.org/"

SRC_URI="https://download.ledgersmb.org/${V}/${P}.tar.gz"

#S="${WORKDIR}/${P}"

LICENSE="GPL-2"

SLOT="1/9"

KEYWORDS="~amd64"

IUSE="systemd edi excel openoffice latex xetex starman"

RDEPEND="acct-group/ledgersmb
acct-user/ledgersmb
>=dev-lang/perl-5.24
dev-db/postgresql:=
dev-perl/Authen-SASL
dev-perl/CGI-Emulate-PSGI
dev-perl/Config-IniFiles
>=dev-perl/Cookie-Baker-0.10
>=dev-perl/DBD-Pg-3.3.0
>=dev-perl/DBI-1.635
dev-perl/Data-UUID
dev-perl/DateTime
>=dev-perl/DateTime-Format-Duration-ISO8601-0.008
dev-perl/DateTime-Format-Strptime
dev-perl/Email-MessageID
dev-perl/Email-Sender
dev-perl/Email-Stuffer
dev-perl/Feature-Compat-Try
dev-perl/File-Find-Rule
dev-perl/Hash-Merge
dev-perl/HTML-Parser
dev-perl/HTML-Escape
dev-perl/HTTP-Headers-Fast
dev-perl/HTTP-Message
dev-perl/IO-stringy
dev-perl/JSON-MaybeXS
dev-perl/Cpanel-JSON-XS
dev-perl/List-MoreUtils
dev-perl/Locale-CLDR
>=dev-perl/Locale-Maketext-Lexicon-0.62
dev-perl/Log-Any
dev-perl/Log-Any-Adapter-Log4perl
dev-perl/Log-Log4perl
dev-perl/libwww-perl
dev-perl/MIME-Types
dev-perl/Module-Runtime
dev-perl/Moo
dev-perl/MooX-Types-MooseLike
dev-perl/Moose
dev-perl/MooseX-ClassAttribute
dev-perl/MooseX-NonMoose
dev-perl/Number-Format
>=dev-perl/PGObject-2.2.0
>=dev-perl/PGObject-Simple-3.0.2
>=dev-perl/PGObject-Simple-Role-2.0.2
>=dev-perl/PGObject-Type-BigFloat-2.0.1
>=dev-perl/PGObject-Type-DateTime-2.0.2
>=dev-perl/PGObject-Type-ByteString-1.2.3
dev-perl/PGObject-Util-DBMethod
>=dev-perl/PGObject-Util-DBAdmin-1.4.0
>=dev-perl/Plack-1.0031
dev-perl/Plack-Builder-Conditionals
dev-perl/Plack-Middleware-ReverseProxy
dev-perl/Plack-Request-WithEncoding
dev-perl/Pod-Parser
dev-perl/Scope-Guard
dev-perl/Session-Storage-Secure
dev-perl/String-Random
>=dev-perl/Template-Toolkit-2.14
dev-perl/Text-CSV
dev-perl/Text-Markdown
dev-perl/URI
dev-perl/Version-Compare
>=dev-perl/Workflow-1.56
dev-perl/XML-LibXML
dev-perl/YAML
dev-perl/namespace-autoclean
dev-perl/Math-BigInt-GMP
starman? ( dev-perl/Starman )
edi? ( 
     dev-perl/X12 
     dev-perl/Path-Class
	 )
latex? ( 
       >=dev-perl/LaTeX-Driver-1.0.0 
       >=dev-perl/Template-Plugin-Latex-3.08 
	   app-text/texlive[extra]
	   )
xetex? ( 
       >=dev-perl/LaTeX-Driver-1.0.0 
       >=dev-perl/Template-Plugin-Latex-3.08 
	   app-text/texlive[extra,xetex]
	   )
excel? (
      dev-perl/Spreadsheet-WriteExcel
	  dev-perl/Excel-Writer-XLSX
	  )
"

PATCHES=(
    "${FILESDIR}/ledgersmb-1.9-systemd.patch"
	"${FILESDIR}/ledgersmb-1.9-openrc.patch"
)

#DEPEND="${RDEPEND}"

src_configure() {
   false
}

# No compilation needed
src_compile() {
   false
}

src_install() {
    cp -R UI bin doc lib locale old package* sql templates utils workflows webpack.config.js "${D}"/usr/share/LedgerSMB_1.9
    use 'systemd' && cp doc/config/systemd/ledgersmb_starman.service "${D}"/etc/systemd/system/ledgersmb-starman.service
	!use 'systemd' && cp -R doc/config/openrc/* "${D}"/etc/

	# You must *personally verify* that this trick doesn't install
	# anything outside of DESTDIR; do this by reading and
	# understanding the install part of the Makefiles.
	# This is the preferred way to install.
	#emake DESTDIR="${D}" install

	# When you hit a failure with emake, do not just use make. It is
	# better to fix the Makefiles to allow proper parallelization.
	# If you fail with that, use "emake -j1", it's still better than make.

	# For Makefiles that don't make proper use of DESTDIR, setting
	# prefix is often an alternative.  However if you do this, then
	# you also need to specify mandir and infodir, since they were
	# passed to ./configure as absolute paths (overriding the prefix
	# setting).
	#emake \
	#	prefix="${D}"/usr \
	#	mandir="${D}"/usr/share/man \
	#	infodir="${D}"/usr/share/info \
	#	libdir="${D}"/usr/$(get_libdir) \
	#	install
	# Again, verify the Makefiles!  We don't want anything falling
	# outside of ${D}.
}
