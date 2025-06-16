# Changelog

All notable changes to **Theom** will be documented in this file.

> This project follows a loose [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format and uses [GitHub releases](https://github.com/axos-project/theom/releases) as the primary source.

> ⚠️ Note on Version History:
> Earlier versions of Theom (prior to 0.6.0) followed an informal versioning scheme.
> Releases were made when significant updates were ready, not necessarily in sequence.
> As such, some version numbers (e.g., 0.2, 0.3) were skipped or never publicly released.
> Starting from version 0.6.0, versioning has become more consistent.

---

## [1.0.1] - 2025-06-16

### Fixed

- Eww calendar not opening

---

## [1.0.0] - 2025-06-16

🎉 **First Stable Release**

Theom has matured into a reliable, customizable desktop experience. Version 1.0.0 marks a major milestone in stability, feature completeness, and usability. This release introduces polish-focused improvements, better documentation, and greater robustness across the board.

### Added

- **Manual Pages**: `man theom`, `man theom-setup`, `man theom-config`
- **Command-line improvements** for `theom` binary:
  - `--help`: shows usage
  - `--version`: shows current version
  - `--dry-run`: starts Theom without committing system changes
- **New documentation files**:
  - `CHANGELOG.md` for structured release notes
  - `TODO.md` for roadmap visibility
  - `PERFORMANCE.report` for performance insights
- **Proper credits** for wallpaper and asset authors in the README

### Changed

- **Eww bar**: Fixed font-size scaling bug in widgets
- **Systray visuals**: Polished integration with `theom-systray`
- **Default theme**: Changed the default theme from light to dark

### Meta

- **Marked as stable (1.0.0)** after extensive internal testing
- **Compatibility mode** (e.g. VM, low-end hardware) confirmed working reliably
- No known bugs at time of release

### Semver & Future Commitments

> Theom now follows [Semantic Versioning 2.0.0](https://semver.org/).  
> Breaking changes will increment the major version.  
> Backward-compatible improvements will be in minor and patch updates.

> This changelog is maintained in [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) style  
> and will reflect all future GitHub release content.

---

This release is for users and contributors who want a solid, predictable starting point. Expect future updates to refine and build upon this foundation — without breaking what works.

## [0.9.0] - 2025-06-14

### Added

- Systray support to the eww bar (`theom-systray` package)

### Fixed

- `theom-welcome` now starts correctly

---

## [0.8.0] - 2025-06-08

### Added

- Improved time widget placement

### Removed

- Network icon from the eww bar

### Fixed

- Eww not launching
- Music play icon bug in eww

---

## [0.7.0] - 2025-06-06

### Added

- Widget support using Conky
- A few default Theom widgets
- Two modes in picom (performance and compatibility)
- Improved VM compatibility - now works without 3D Accel

### Fixed

- Dunst foreground bug
- Picom theme bug

---

## [0.6.1] - 2025-06-06

### Added

- New wallpapers (Axos wallpaper collection)
- Default wallpaper
- Tnotifications (notification GUI)
- Capitaine cursor as new default
- Improved eww bar

### Fixed

- MPD playback bug

---

## [0.6.0] - 2025-05-31

> ⚠️ This version is incomplete and intended to fix stability issues from 0.5.9.

### Added

- Eww static systray items
- `tscdctl` (Theom Scary Config Demon Control)
- Welcome notification on first login
- Config fallback for missing `keybindings.conf`

### Fixed

- Potential DE black screen and broken keybindings from 0.5.9

---

## [0.5.9] - 2025-05-30

> ❌ Deprecated due to major bug.

### Added

- Better eww integration
- Switched config from `.json` to `.toml`
- Customizable keybindings

### Fixed

- Several eww and polybar bugs

### Upcoming (Preview)

- Dark theme
- Light GTK theme
- Basic systray functionality
- Better theming support

---

## [0.5.6] - 2025-05-26

### Changed

- Major overhaul of Theom packages
- Beginning transition from Polybar to Eww

---

## [0.5.5] - 2025-05-24

### Changed

- New default wallpaper set

---

## [0.5.4] - 2025-05-24

### Fixed

- General bug fixes and minor improvements to packages

---

## [0.5.0] - 2025-05-20

### Major Changes

- New UI design
- MPD integration for music
- Dashboard added
- Improved all core applications

> Many other changes — some undocumented.

---

## [0.4.0] - 2025-05-16

### Added

- Light mode
- Welcome screen
- Theom settings app
- Better default compositing
- Improved stability

---

## [0.1.0] - 2025-05-09

### Initial release

- Theom goes public 🎉

---
