# vim: set noet tabstop=5:

CC := gcc-7
CXX := g++-7
CPPFLAGS := -D_FORTIFY_SOURCE=2
LOCALMK_CMAKE_FLAGS = -DMIN_LOG_LEVEL=0 -DCMAKE_INSTALL_PREFIX=/usr/local
all:
	setenv
.PHONY: ypcrtsrel
ypcrtsrel: CFLAGS := -O2 -fstack-protector-strong -pie -fPIE
ypcrtsrel: LOCALMK_CMAKE_FLAGS += -DCMAKE_BUILD_TYPE=RelWithDebInfo
ypcrtsrel: _ypcrtsclean _ypcrtsbuild _ypcrtsinstall

.PHONY: ypcrtsdebug
ypcrtsdebug: LOCALMK_CMAKE_FLAGS += -DCMAKE_BUILD_TYPE=Debug
ypcrtsdebug: _ypcrtsclean _ypcrtsbuild _ypcrtsinstall

.PHONY: _ypcrtsclean
_ypcrtsclean: clean
	rm -rf build
	mkdir -p build

.PHONY: ypcrtsdeps
ypcrtsdeps: distclean
	#export CC=$(CC) CXX=$(CC) CPPFLAGS=$(CPPFLAGS) && 
	make deps

.PHONY: _ypcrtsbuild
_ypcrtsbuild: EXPORTS = export CC="$(CC)" CXX="$(CXX)" CPPFLAGS="$(CPPFLAGS)" CFLAGS="$(CFLAGS)"
_ypcrtsbuild: _ypcrtsclean
	cd build && $(EXPORTS) && cmake .. $(LOCALMK_CMAKE_FLAGS)

.PHONY: _ypcrtsinstall
_ypcrtsinstall:
	# make installs
	make

.PHONY: ypcrtsbrew
ypcrtsbrew:
	brew install libtool automake cmake pkg-config gettext ninja gcc
