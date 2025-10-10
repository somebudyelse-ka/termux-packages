TERMUX_PKG_HOMEPAGE="https://chawan.net/"
TERMUX_PKG_DESCRIPTION="TUI web browser"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.2.2"
TERMUX_PKG_SRCURL="https://git.sr.ht/~bptato/chawan/archive/v${TERMUX_PKG_VERSION}.tar.gz"
TERMUX_PKG_SHA256=30b4108247244f6b0721d44f84ba90cebf8ce5892ed9502d7e7c3fed92f65489
TERMUX_PKG_BUILD_DEPENDS="nim,openssl,libssh2,brotli,pkg-config,make"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_make() {
	make
}

termux_step_make_install() {
	install -Dm755 "$TERMUX_PKG_SRCDIR/target/release/bin/cha" "$TERMUX_PREFIX/bin/cha"
	install -Dm755 "$TERMUX_PKG_SRCDIR/target/release/bin/mancha" "$TERMUX_PREFIX/bin/mancha"
	install -Dm644 "$TERMUX_PKG_SRCDIR/doc/cha-api.7" "$TERMUX_PREFIX/share/man/man7/cha-api.7"
  install -Dm644 "$TERMUX_PKG_SRCDIR/doc/cha-config.5" "$TERMUX_PREFIX/share/man/man5/cha-config.5"
  install -Dm644 "$TERMUX_PKG_SRCDIR/doc/cha-css.7" "$TERMUX_PREFIX/share/man/man7/cha-css.7"
  install -Dm644 "$TERMUX_PKG_SRCDIR/doc/cha-image.7" "$TERMUX_PREFIX/share/man/man7/cha-image.7"
  install -Dm644 "$TERMUX_PKG_SRCDIR/doc/cha-localcgi.5" "$TERMUX_PREFIX/share/man/man5/cha-localcgi.5"
  install -Dm644 "$TERMUX_PKG_SRCDIR/doc/cha-mailcap.5" "$TERMUX_PREFIX/share/man/man5/cha-mailcap.5"
  install -Dm644 "$TERMUX_PKG_SRCDIR/doc/cha-mime.types.5" "$TERMUX_PREFIX/share/man/man5/cha-mime.types.5"
  install -Dm644 "$TERMUX_PKG_SRCDIR/doc/cha-protocols.7" "$TERMUX_PREFIX/share/man/man7/cha-protocols.7"
  install -Dm644 "$TERMUX_PKG_SRCDIR/doc/cha-terminal.7" "$TERMUX_PREFIX/share/man/man7/cha-terminal.7"
  install -Dm644 "$TERMUX_PKG_SRCDIR/doc/cha-troubleshooting.7" "$TERMUX_PREFIX/share/man/man7/cha-troubleshooting.7"
  install -Dm644 "$TERMUX_PKG_SRCDIR/doc/cha-urimethodmap.5" "$TERMUX_PREFIX/share/man/man5/cha-urimethodmap.5"
  install -Dm644 "$TERMUX_PKG_SRCDIR/doc/cha.1" "$TERMUX_PREFIX/share/man/man1/cha.1"
  install -Dm644 "$TERMUX_PKG_SRCDIR/doc/mancha.1" "$TERMUX_PREFIX/share/man/man1/mancha.1"
}
