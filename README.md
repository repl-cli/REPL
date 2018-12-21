# REPL

![Version](https://img.shields.io/github/tag/DamianRivas/REPL.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

`REPL` is a simple bash script for creating and running self-deleting programs locally, offline, and out of the browser.

**REPL is now in Beta.**

Repls are saved to the OS's `/tmp` folder. This means that you don't have to worry about managing the files. The OS will delete them automatically when you shut down your computer!

## Getting Started

### Install Script ( Linux/macOS )

1. REPL is installed through the terminal with the following command:

```
curl -o- https://raw.githubusercontent.com/DamianRivas/REPL/v0.4.1/install.sh | bash
```

2. That's it!

<sub>The script clones to `~/.repl` and adds it to your PATH. You may have to restart your shell.</sub>

During installation REPL will attempt to configure the PATH. Because of differences between platforms, command shells, and bugs in REPL, the modifications to PATH may not take effect until the console is restarted, or the user is logged out, or it may not succeed at all.

If, after installation, running `repl status` in the console fails, this is the most likely reason.

### Manual Install

Coming soon...

<sub>I've received news that REPL works with `Git Bash`. The `/tmp` directory in git bash redirects to `C:\Users\<user>\AppData\Local\Temp`</sub>

### Using REPL

**NOTICE: REPL uses `nano` by default. I highly suggest changing this to your favorite editor by editing the `config` file before using REPL.**

To start a new repl, run `repl <lang>`, where `<lang>` is the file extension for the programming language you'd like to use.

I.E.

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

Coming soon...

## Supported Languages

[//]: # "When editing, the list below must be kept in alphabetical order"

- C (`c`)
- C++ (`cpp`)
- JavaScript (`js`)
- Python (`py`)
- Ruby (`rb`)
- Rust (`rs`)

<sub>You must have the necessary compilers/runtimes installed (I.E. `node.js` for JavaScript or `rustc` for Rust). Edit the `config` file to configure the compilers/runtimes that REPL uses.</sub>

## Contributing

Was REPL useful to you? Maybe you just like the project? Donate a star :)

Check out our [Contributing Guidelines](https://github.com/DamianRivas/REPL/blob/master/CONTRIBUTING.md)

I'm far from a bash expert, so any and all help is much appreciated! That includes anyone who can test REPL in a variety of configurations and environments (i.e. lesser used compilers and/or Linux distros)

Below are some ideas for the project. If you'd like to start a conversation regarding anything below, or anything in general, feel free to open a new issue!

### To-Do / Ideas

[x] Properly handle compilation and execution of compiled languages

[] Create repls with required boilerplate (i.e. Java class)

[] Option to customize where new repls are created

[] Option to save repls to a location specified in `config`

[] Handle flags

[] `--help` for instructions

[] `-n` to open a brand new repl (come up with a naming system)

[] `-o` open a new repl online at repl.it

[x] Streamline installation with a script similar to [nvm](https://github.com/creationix/nvm) or [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

[] Windows Subsystem for Linux support.

### Upcoming Languages

[x] C

[] Go

[] Java

[x] Python

[x] Ruby

[x] Rust

[] TypeScript

---

I want to dedicate this section to acknowledge the help and inspiration this project received from other OSS scripts such as [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) and [Node Version Manager(nvm)](https://github.com/creationix/nvm). This project wouldn't be what it is without them!
