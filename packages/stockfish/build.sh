TERMUX_PKG_HOMEPAGE=https://stockfishchess.org/
TERMUX_PKG_DESCRIPTION="A free and strong UCI chess engine"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_VERSION=17.1
TERMUX_PKG_SRCURL=https://github.com/official-stockfish/Stockfish/archive/refs/tags/sf_${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=0cfd9396438798cc68f5c0d5fa0bb458bb8ffff7de06add841aaeace86bec1f1

termux_step_make () {
	cd src
	local TARGET_ARCH
	case "$TERMUX_ARCH" in
		'aarch64') TARGET_ARCH='armv8';;
		'arm')     TARGET_ARCH='armv7';;
		'x86_64')  TARGET_ARCH='x86-64';;
		'i686')    TARGET_ARCH='x86-32';;
		*) termux_error_exit "Architecture not supported by build system"
	esac
	make net
	if [[ "$TERMUX_ARCH" == "arm" ]]; then
		export CXX='armv7a-linux-androideabi${TERMUX_PKG_API_LEVEL}-clang++'
	else
		export CXX='${TERMUX_ARCH}-linux-android${TERMUX_PKG_API_LEVEL}-clang++'
	fi
	make -j build ARCH=$TARGET_ARCH COMP=ndk CXX=$CXX
	make strip ARCH=$TARGET_ARCH COMP=ndk CXX=$CXX
}
