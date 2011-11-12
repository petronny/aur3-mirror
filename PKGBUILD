pkgname=gmtk-svn
pkgver=65
pkgrel=1
pkgdesc='Gnome MPlayer support library'
arch=('i686' 'x86_64')
url='http://gmtk.googlecode.com/'
license=('GPL')
depends=('dconf' 'fontconfig' 'pulseaudio')
makedepends=('subversion')
provides=('gmtk')
 
_svntrunk=http://gmtk.googlecode.com/svn/trunk
_svnmod=gmtk-read-only
 
build() {
cd "${srcdir}"
 
msg2 "Checking out the repository..."
if [ -d $_svnmod/.svn ]; then
(cd $_svnmod && svn up -r $pkgver)
else
svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
fi
 
msg2 "SVN checkout done or server timeout."
 
rm -rf "$srcdir/$_svnmod-build"
cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
cd "$srcdir/$_svnmod-build"
 
msg2 "Configuring..."
./autogen.sh --prefix=/usr --sysconfdir=/etc --with-pulseaudio
msg2 "Building..."
make
}
 
package() {
cd "$srcdir/$_svnmod-build"
 
make DESTDIR="$pkgdir/" install
}
