TERMUX_PKG_HOMEPAGE=https://stockfishchess.org/
TERMUX_PKG_DESCRIPTION="A free and strong UCI chess engine"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_BUILD_DEPENDS="git, build-essential, clang, make, wget, libcompiler-rt"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_VERSION=17.1
TERMUX_PKG_SRCURL=https://github.com/official-stockfish/Stockfish/archive/refs/tags/sf_${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=0cfd9396438798cc68f5c0d5fa0bb458bb8ffff7de06add841aaeace86bec1f1

termux_step_make () {
	cd src
	make -j profile-build optimize=no
}

termux_step_make_install() {
	install -Dm755 "$TERMUX_PKG_SRCDIR/src/stockfish" "$TERMUX_PREFIX/bin/stockfish"
}
