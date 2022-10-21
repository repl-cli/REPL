# Contributing Guidelines

Thank you for contributing to `REPL`!

The best ways to contribute right now are through pull requests and/or issues.

However, before submitting, please review the following:

## Bug Reports

- Please make sure the bug is reproducible, and give us the steps to reproduce it, so that we can dig into the problem.
- Please give us as much detail as possible about your environment, so we can more easily confirm the problem.

## Pull Requests

You should be familiar with the basics of
[contributing on GitHub](https://help.github.com/articles/using-pull-requests).

[Run the tests](#Tests) before submitting. New functionality should come with its own tests.

Make sure `config` is in its **default** state before submitting! Copy the contents of `config.default` over to `config` if needed:

```bash
cat config.default > config
```

Permanent changes to `config` must also be made to `config.default`.

Also, be so kind as to reference
any issue that would be solved in the PR description body,
[for instance](https://help.github.com/articles/closing-issues-via-commit-messages/)
_"Fixes #XXXX"_ for issue number XXXX.

In addition:

- Please maintain consistent whitespace - 2-space indentation, trailing newlines in all files, etc.
- Any time you make a change to your PR, please rebase freshly on top of master.

Even if you don't have all of these items covered, please still feel free to submit a PR/issue! Someone else may be inspired and volunteer to complete it for you.

Thanks again!

## Tests

#### Set up

1. Install [shellcheck](https://github.com/koalaman/shellcheck) if you don't already have it.

2. Install the shunit submodule if you don't already have it:

   - `cd` to your development clone of REPL
   - Run `git submodule update --init --recursive`

3. Run `chmod +x test.sh` if you haven't already.

#### Running the tests

Go to your development clone of REPL in the terminal and run `./test.sh` **from the project's root directory**.

It's also possible to run individual test files from the project's root directory:

```
bash test/modules_test.sh
```

Visit [shUnit2](https://github.com/kward/shunit2/) to learn more about the testing framework used in REPL.

## Adding Support for New Languages

I can't possibly know how to use or set up every programming language in existence. If you'd like to see support for a programming language that you use, make a pull request!

Adding support for a new language is easy! Currently, there are four steps for this:

1. Create a module in [repl_modules](repl_modules)

   - This module should follow the naming conventions of the other modules (i.e. `repl_<file-extension>()`)
   - Boilerplate code (if any) should **only** print `Hello world!`
     - This is important for tests
   - The `run` method should compile and/or run the repl with the appropriate compiler and/or runtime

2. Add the programming language's file extension to the list in [`language_support.sh`](language_support.sh)

3. Create a test for the module in [`test/modules_test.sh`](test/modules_test.sh)

4. Update the `config` files with appropriate defaults for the language's compiler and/or runtime

That's it! Make sure all tests pass before submitting a new pull request.

## HACKTOBERFEST
Check out [this PR]() to see what a solid contribution looks like for hacktoberfest!
