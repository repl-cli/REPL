# REPL

`REPL` is a simple bash script for creating and running self-deleting programs locally, offline, and out of the browser.

**Still in development: Pre-Alpha stage.**

Repls are saved to the OS's `/tmp` folder. This means that you don't have to worry about managing the files. The OS will delete them automatically when you shut down your computer!

# Getting Started

Make sure you are on Linux or macOS.

## Installation

1. Clone the repo to your machine. Preferably to your `$HOME` directory:

```
git clone https://github.com/DamianRivas/REPL.git .repl
```

2. Add `.repl` to your PATH

3. That's it! Run `repl js` to test it out.

## Using REPL

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

Check out our list of supported languages, and their file extensions, directly below.

## Supported Languages

[//]: # "When editing, the list below must be kept in alphabetical order"

- C (`c`)
- C++ (`cpp`)
- JavaScript (`js`)
- Python (`py`)
- Ruby (`rb`)
- Rust (`rs`)

# To-Do / Ideas

[x] Properly handle compilation and execution of compiled languages

[] Create repls with required boilerplate (i.e. Java class)

[] Option to save repls to a location specified in `config`

[] Handle flags

[] `-n` to open a brand new repl (come up with a naming system)

[] `-o` open a new repl online at repl.it

[] Streamline installation with a script similar to [nvm](https://github.com/creationix/nvm) or [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

## Upcoming Languages

[x] C

[] Java

[x] Python

[x] Ruby

[x] Rust

[] TypeScript
