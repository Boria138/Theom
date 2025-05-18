pkgname="theom"
pkgver="0.4.1"
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
  'alsa-utils'
  'lxappearance'
  'python'
  'materia-gtk-theme'
  'pcmanfm' # fle manager
  'starship'
  'blueman'
  'theom-settings'
  'theom-welcome'
)

url="https://github.com/AxOS-project/theom"
license=('GPL')

optdepends=(
  'mpd: MPD music player'
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
