# Contributing to Theom Desktop Environment

Thanks for your interest in contributing to Theom! Whether you're submitting code, reporting bugs, improving documentation, or suggesting ideas - you're welcome here.

---

## What You Can Contribute

We welcome contributions in many forms:

- Code (core components, integrations, scripts, conky widgets, etc.)
- Bug reports
- Documentation improvements
- Themes and style tweaks
- Packaging or install script fixes
- Design/UI feedback
- Feature suggestions

---

## Getting Started

### Suggestions, Feedback, or Bug Reports

If you have ideas, usability feedback, or found a bug that doesn't require you to change the code:

1. [Open an issue](https://github.com/AxOS-project/theom/issues) with a clear title and description.
2. Choose the appropriate issue template: `bug`, `feature request`, `blank issue`.
3. Include details like:
   - What you expected vs what happened
   - Steps to reproduce (if it’s a bug)
   - Screenshots (if visual)

_You don’t need to write code to be a valuable contributor._

### Code contribution

1. **[Fork](https://github.com/AxOS-project/Theom/fork)** this repository.
2. **Clone** your fork locally:
   ```bash
   git clone https://github.com/YOUR-USERNAME/FORK-NAME.git
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
- run `./extra_scripts/update_deps_txt.sh` if you updated the PKGBUILD to change the dependencies
- run `./update_version.sh <version_num>` to upgrade the theom version on all required files.

**Usage example**:

```bash
# After updating the theom manual
./gen_man.sh # Run this in the root of the project

# After updating the theom dependencies
./extra_scripts/update_deps_txt.sh # Run this in the root of the project

# When upgrading theom version. (eg: 1.0.0 -> 1.0.1)
./update_version.sh 1.0.1 # Run this in the root of the project
```
