TERMUX_PKG_HOMEPAGE=https://github.com/vergoh/vnstat
TERMUX_PKG_DESCRIPTION="a network traffic monitor for Linux and BSD"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=2.8
TERMUX_PKG_SRCURL=https://github.com/vergoh/vnstat/releases/download/v${TERMUX_PKG_VERSION}/vnstat-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=03f858a7abf6bd85bb8cd595f3541fc3bd31f8f400ec092ef3034825ccb77c25
TERMUX_PKG_DEPENDS="libsqlite, libgd, check"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_CONFFILES="etc/vnstat.conf"
TERMUX_PKG_SERVICE_SCRIPT=("vnstatd" 'exec vnstatd -d 2>&1')

termux_step_make_install() {
	sed -i "s/\var/@TERMUX_PREFIX@\/var/g" cfg/vnstat.conf
}
