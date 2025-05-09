pkgname="theom"
pkgver="0.1"
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
  'flameshot'
  'parcellite'
  'network-manager-applet'
  'dunst'
  'rofi'
  'feh'
  'ttf-firacode-nerd'
  'pipewire'
  'libpipewire'
  'pipewire-alsa'
  'pipewire-pulse'
)

url="https://github.com/Byson94/theom"
license=('GPL')

optdepends=('mpd: MPD music player')

package() {
    mkdir -p "${pkgdir}/usr/"
    
    cp -r "$srcdir/bin" "$pkgdir/usr/"
    cp -r "$srcdir/share" "$pkgdir/usr/"

    install -Dm644 "$srcdir/share/xsessions/theom.desktop" "$pkgdir/usr/share/xsessions/theom.desktop"
}
