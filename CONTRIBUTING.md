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

Use [shellcheck](https://github.com/koalaman/shellcheck) to identify and fix issues in `repl` before submitting (i.e. `shellcheck -x repl`). No output is good output!

Make sure `config` is in its **default** state before submitting! Copy the contents of `config.default` over to `config` if needed. And changes to `config` must also be made to `config.default`.

Also, be so kind as to reference
any issue that would be solved in the PR description body,
[for instance](https://help.github.com/articles/closing-issues-via-commit-messages/)
_"Fixes #XXXX"_ for issue number XXXX.

In addition:

- Please maintain consistent whitespace - 2-space indentation, trailing newlines in all files, etc.
- Any time you make a change to your PR, please rebase freshly on top of master. Nobody likes merge commits.

---

Even if you don't have all of these items covered, please still feel free to submit a PR/issue! Someone else may be inspired and volunteer to complete it for you.

Thanks again!

## Adding Support for New Language

I can't possibly know how to use or set up every single programming language out there. If you'd like to see support for a programming language that you use, make a pull request!

Adding support for a new language is easy! Currently, there are two steps for this:

1. Create a module in [repl_modules](repl_modules)

   - This module should follow the naming conventions of the other modules (i.e. `repl_<file-extension>()`)
   - This module should compile and/or run the repl with the appropriate compiler and/or runtime

2. Add the programming language's file extension to the list in [language_support.sh](language_support.sh)
