# Contributing to Theom Desktop Environment

Thanks for your interest in contributing to Theom! Whether you're submitting code, reporting bugs, improving documentation, or suggesting ideas — you're welcome here.

---

## What You Can Contribute

We welcome contributions in many forms:

- Code (core components, integrations, scripts, EWW widgets, etc.)
- Bug reports
- Documentation improvements
- Themes and style tweaks
- Translations (eventually)
- Packaging or install script fixes
- Design/UI feedback
- Feature suggestions

---

## Getting Started

1. **Fork** this repository.
2. **Clone** your fork locally:
   ```bash
   git clone https://github.com/AxOS-project/Theom.git
   ```
3. Create a **new branch** for your contribution:
   ```bash
   git checkout -b change/your-change
   ```
4. Make your changes.
5. Commit and push:

```bash
git commit -m "explain what the commit does"
git push origin change/your-change
```

7. Open a PR (Pull request) on Theom repository.

## Testing

Before you do make a PR (Pull request) on a code contribution, make sure that it works.

## Project overview

- `src/` folder contains the source code of theom.
- `src/bin` contains the binaries that theom require to run.
- `src/share` is where theom (configs/scripts/themes) and theom xsession folders are located.
- `src/share/theom` contains the theom configs, scripts, themes etc.
- `src/share/xsession` contains the xsession that shows theom on the greeter.
- `src/share/theom/config` contains all the configs of theom.

## Using scripts

- run `./gen_man.sh` if you updated the manual to generate the manual in `/src/share/man/`
- run `./update_deps_txt.sh` if you updated the PKGBUILD to change the dependencies
- run `./update_version.sh <version_num>` to upgrade the theom version on all required files.

**Usage example**:

```bash
# After updating the theom manual
./gen_man.sh # Run this in the root of the project

# After updating the theom dependencies
./update_deps_txt.sh # Run this in the root of the project

# When upgrading theom version. (eg: 1.0.0 -> 1.0.1)
./update_version.sh 1.0.1 # Run this in the root of the project
```
