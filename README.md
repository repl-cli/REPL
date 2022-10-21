# REPL

![Version](https://img.shields.io/github/tag/repl-cli/REPL.svg?label=release)
[![Build Status](https://travis-ci.com/repl-cli/REPL.svg?branch=master)](https://travis-ci.com/repl-cli/REPL)
[![license: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

`REPL` is a simple bash script for creating and running self-deleting programs locally, offline, and out of the browser.

Why REPL? Take a look at our [vision](VISION.md) for this project.

**REPL is now in Beta.**

Repls are saved to the OS's `/tmp` folder. This means that you don't have to worry about managing the files. The OS will delete them automatically when you shut down your computer!

## Getting Started

### Install Script ( Linux/macOS )

1. REPL is installed through the terminal with the following command:

```
curl -o- https://raw.githubusercontent.com/repl-cli/REPL/v0.9.0/install.sh | bash
```

2. That's it!

<sub>The script clones to `~/.repl` and adds it to your PATH. You may have to restart your shell.</sub>

During installation REPL will attempt to configure the PATH. Because of differences between platforms, command shells, and bugs in REPL, the modifications to PATH may not take effect until the console is restarted, or the user is logged out, or it may not succeed at all.

If, after installation, running `repl status` in the console fails, this is the most likely reason.

### Manual Install

1. Run `cd ~`

2. Run `git clone https://github.com/repl-cli/REPL.git .repl`

3. Add the installation directory to your `PATH`

To add REPL to your `PATH`, add the following to your `.bashrc`, `.zshrc`, or `.profile`:

```bash
export PATH="$HOME/.repl/bin:$PATH"
```

<sub>**Advanced Windows Users**: I've received news that REPL works with `Git Bash` on Windows. The `/tmp` directory in git bash redirects to `C:\Users\<user>\AppData\Local\Temp`.</sub>

### Using REPL

REPL is fairly simple to use, but if you want more details check out the [docs](docs/).

**NOTICE: REPL uses `nano` by default. I highly suggest changing this to your favorite editor before your first use:**

For example, changing the editor to VS Code:

```bash
repl config editor code
```

To start a new repl, run `repl <lang>`, where `<lang>` is the file extension for the programming language you'd like to use.

Example:

```
repl js
```

`REPL` will open your editor set in the config file. You can configure this to your liking. To run your repl, go back to the terminal and run:

```
repl run
```

`REPL` already knows which repl you last opened and it will run the repl for you. No need to worry about compilation or using the correct runtime for each language!

If time passes and you forget which repl you are on, simply run:

```
repl status
```

Check out our list of [supported languages](#supported-languages), and their file extensions, below.

## Configuring REPL

You can configure REPL by editing the [config](config) file in the source folder.

To change the editor that REPL uses, edit the `EDITOR=` field:

```bash
EDITOR="code"
```

You can also change which compilers are used by REPL:

```bash
C_COMPILER="clang"
```

**NOTICE**: The config file is a bash script. Make sure there are no spaces before, and after, the equals sign, `=`.

If you break the config file and you're not sure how to fix it, you can copy the contents of `config.default` over to `config` to reset it.

## Supported Languages

[//]: # "COMMENT: When editing, the list below must be kept in alphabetical order"

- C (`c`)
- C++ (`cpp`)
- Java (`java`)
- JavaScript (`js`)
- Python (`py`)
- Ruby (`rb`)
- Rust (`rs`)

<sub>You must have the necessary compilers/runtimes installed (e.g., `node.js` for JavaScript or `rustc` for Rust). Edit the `config` file to configure the compilers/runtimes that REPL uses.</sub>

Can't find your programming language? Let us know in a new issue, or better yet, submit it in a pull request! :)

## Contributing

Was REPL useful to you? Maybe you just like the project? Donate a star :)

Check out our [Contributing Guidelines](CONTRIBUTING.md) if you'd like to help out with the project (including adding new language support!).

I'm far from a bash expert, so any and all help is much appreciated! That includes anyone who can test REPL in a variety of configurations and environments (i.e., lesser used compilers and/or Linux distros).

Below are some ideas for the project. If you'd like to start a conversation regarding anything below, or anything in general, feel free to open a new issue!

### To-Do / Ideas

- [x] Properly handle compilation and execution of compiled languages
- [x] Create repls with required boilerplate (e.g., Java class)
- [x] Configure REPL through the CLI (e.g., `repl config editor $(which vim)`)
- [x] Option to customize where new repls are created
- [ ] Option to save repls to a specified location
- [ ] Handle flags
- [ ] `--help` for instructions
- [ ] `-n` to open a brand new repl (come up with a naming system)
- [ ] `-o` open a new repl online at repl.it
- [ ] `-e` to specify an editor
- [x] Streamline installation with a script similar to [nvm](https://github.com/creationix/nvm) or [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- [x] Windows Subsystem for Linux support.

## Copyright

© 2022 Damian Rivas

REPL is released under an MIT license; see [`LICENSE`](LICENSE) for details.

---

I want to dedicate this section to acknowledge the help and inspiration this project received from other FOSS projects. REPL wouldn't be what it is without them!

- [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)

- [Node Version Manager(nvm)](https://github.com/creationix/nvm).

- [shellcheck](https://www.shellcheck.net/)

- [shUnit2](https://github.com/kward/shunit2/)
