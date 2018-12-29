# Running Your Repl

After you open a repl and write some code, you can run your repl in the terminal by running:

```
repl run
```

REPL keeps track of the last repl that you opened. It already knows how to run your code, so you normally don't have to worry about it. As long as you have the appropriate runtimes/compilers installed (i.e. node.js for `JavaScript` or clang for `C`), there shouldn't be any issues.

If you want to configure how the code is run (like change which compiler that REPL uses), you can edit that in the [config](../config) file. An example of when you'd want to do this is if you want REPL to use a specific version of a runtime.

## repl status

As stated before, REPL keeps track of the last repl that you opened. If you ever forget which repl you're on, you can run:

```
repl status
```

Example output:

```
repl: status: currently in a cpp repl
```

---

[Back](README.md)
