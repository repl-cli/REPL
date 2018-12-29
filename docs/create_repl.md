# Creating/Editing a Repl

The command to create or edit a repl follows this:

```
repl <file-extension>
```

Where `<file-extension>` is the file extension that you'd use for the programming language that you want to code in. For example, if you wanted to create a new C++ repl, you would run the following:

```
repl cpp
```

**More examples**:

JavaScript:

```
repl js
```

Rust:

```
repl rs
```

REPL will create the file in your OS's temporary directory, and then open the file with the editor that's configured in the [config](../config) file. It's highly recommended that you edit this file to configure REPL to use your favorite editor before opening your first repl.

By creating the repl in the temp directory, this ensures that the file is deleted on its own when you reboot your computer. This saves you from having to worry about file management.

---

[Back](README.md)
