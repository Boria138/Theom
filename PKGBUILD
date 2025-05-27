pkgname="theom"
pkgver="0.5.7"
pkgrel="1"
pkgdesc="Theom desktop environement"
arch=("x86_64")
depends=(
  'xorg-server'
  'pipewire-pulse'
  'brightnessctl'
  'picom'
  'i3-wm'
  'i3-gaps'
  'polybar'
  'alacritty'
  'dunst'
  'rofi'
  'feh'
  'ttf-firacode-nerd'
  'pipewire'
  'libpipewire'
  'pipewire-alsa'
  'pipewire-pulse'
  'alsa-utils'
  'alsa-plugins'
  'upower'
  'pamixer'
  'jq'
  'theom-extras' # optional apps
  'theom-utils' # custom theom apps
)

url="https://github.com/AxOS-project/theom"
license=('GPL')

optdepends=(
  'plattenalbum: A GUI music player for mpd'
)

package() {
    mkdir -p "${pkgdir}/usr/"
    
    cp -r "$srcdir/bin" "$pkgdir/usr/"
    cp -r "$srcdir/share" "$pkgdir/usr/"

    install -Dm644 "$srcdir/share/xsessions/theom.desktop" "$pkgdir/usr/share/xsessions/theom.desktop"

    install -Dm644 "$srcdir/share/theom/themes/fonts/feather.ttf" \
    "$pkgdir/usr/share/fonts/feather.ttf"
}
