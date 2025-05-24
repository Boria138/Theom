# Theom

**Theom** is an extremely lightweight desktop environment built on top of i3wm for [AxOS](https://www.axos-project.com/), designed for speed, simplicity, and elegance. Ideal for minimalists, power users, and systems where every megabyte matters.

## Features

- Minimal resource usage: 350-400MB ram use on idle
- Comes with two different themes: a dark theme and a light theme
- Has a built in dashboard
- Has a settings application to tweak the settings of theom
- Welcomes user friendly greeter during startup
- Easy to customize

## Screenshots

![image](https://raw.githubusercontent.com/AxOS-project/Theom/main/screenshots/screenshot1.png)
![image](https://raw.githubusercontent.com/AxOS-project/Theom/main/screenshots/screenshot2.png)
![image](https://raw.githubusercontent.com/AxOS-project/Theom/main/screenshots/screenshot3.png)
![image](https://raw.githubusercontent.com/AxOS-project/Theom/main/screenshots/screenshot4.png)
![image](https://raw.githubusercontent.com/AxOS-project/Theom/main/screenshots/screenshot5.png)

## Installation

- Install the latest version from the [releases](https://github.com/AxOS-project/Theom/releases) and run the following command.

```
sudo pacman -U <installed-file>
```

## Keyboard shortcuts

> [!IMPORTANT]
> The `mod` key is the windows key on your device.

### Essentials

- `mod+Return` — Open terminal (opens the default terminal - Alacritty)
- `mod+d` — Launch application launcher (Rofi is the default)
- `mod+Shift+d` — Open Theom dashboard
- `mod+Shift+q` — Close the focused window
- `mod+f` — Toggle fullscreen for the focused window
- `mod+Shift+space` — Toggle floating mode for the focused window
- `mod+space` — Toggle focus between tiling and floating windows
- `mod+Shift+e` — Exit i3 with confirmation
- `Print` — Take a screenshot using Flameshot

### Workspace Management

- `mod+1` through `mod+0` — Switch to workspace 1–10
- `mod+Shift+1` through `mod+Shift+0` — Move focused window to workspace 1–10

### Window Focus

- `mod+j` — Focus left
- `mod+k` — Focus down
- `mod+l` — Focus up
- `mod+semicolon` — Focus right
- `mod+Left/Down/Up/Right` — Focus window in that direction
- `mod+a` — Focus the parent container

### Window Movement

- `mod+Shift+j` — Move window left
- `mod+Shift+k` — Move window down
- `mod+Shift+l` — Move window up
- `mod+Shift+semicolon` — Move window right
- `mod+Shift+Left/Down/Up/Right` — Move window using arrow keys

### Layout

- `mod+h` — Split container horizontally
- `mod+v` — Split container vertically
- `mod+e` — Toggle split orientation
- `mod+s` — Set layout to stacking
- `mod+w` — Set layout to tabbed

### Scratchpad

- `mod+minus` — Move the currently focused window to the scratchpad
- `mod+Shift+minus` — Show the first window from the scratchpad

### Resize Mode

- `mod+r` — Enter resize mode
  - `j` / `Left` — Shrink width
  - `k` / `Down` — Grow height
  - `l` / `Up` — Shrink height
  - `semicolon` / `Right` — Grow width
  - `Enter` / `Escape` / `mod+r` — Exit resize mode

### System

The following keybindings are the `function` keys in your keyboard. For example, `XF86MonBrightnessUp` is the `f3` key in my keyboard.

- `XF86MonBrightnessUp` — Increase brightness (via `brightnessctl`)
- `XF86MonBrightnessDown` — Decrease brightness
- `XF86AudioRaiseVolume` — Increase volume
- `XF86AudioLowerVolume` — Decrease volume
- `XF86AudioMute` — Toggle audio mute
- `XF86AudioMicMute` — Toggle microphone mute

## Dependencies

View the dependencies in [the deps.txt file](https://raw.githubusercontent.com/AxOS-project/Theom/main/deps.txt)
