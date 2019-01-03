# Configuring REPL

## Configure the editor

You can change which editor REPL uses to open repls:

Example:

```
repl config editor code
```

That will configure REPL to use VS Code. If you have VS Code installed, the next time you open a repl such as `repl js`, it will open the repl in VS Code.

You can configure any editor you'd like.

More examples:

```
repl config editor nano
```

```
repl config editor $(which vim)
```

## Advanced

You can configure REPL by editing the [config](../config) file in the source folder.

To change the editor that REPL uses, edit the `EDITOR=` field:

```bash
EDITOR="code"
```

You can also change which runtimes/compilers are used by REPL:

```bash
C_COMPILER="clang"
```

**NOTICE**: The config file is a bash script. Make sure there are no spaces before, and after, the equals sign, `=`.

If you break the config file and you're not sure how to fix it, you can copy the contents of `config.default` over to `config` to reset it:

```
cd ~/.repl && cat config.default > config
```

---

[Back](README.md)
