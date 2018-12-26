#!/bin/bash
# shellcheck shell=bash
# Run this file to run all the tests, once

shellcheck_fail() {
  local file="$1"

  printf '\n'
  printf '###################\n\n'
  printf 'PRELIMINARY RESULTS\n\n'
  printf 'FAIL: "%s" did not pass shellcheck analysis\n' "$file"
  printf '      Address the issues above and try again.\n'

  exit 1
}

shellcheck_pass() {
  printf '###################\n\n'
  printf 'PRELIMINARY RESULTS\n\n'
  printf 'PASS: shellcheck analysis\n\n'
}

shellcheck_module() {
  shellcheck test.sh || shellcheck_fail "test.sh"
  shellcheck -x repl || shellcheck_fail "repl"
  shellcheck repl_modules || shellcheck_fail "repl_modules"
  shellcheck language_support.sh || shellcheck_fail "language_support.sh"
  shellcheck -e SC2034,SC2148 config || shellcheck_fail "config"
  shellcheck -e SC2034,SC2148 config.default || shellcheck_fail "config.default"
  shellcheck install.sh || shellcheck_fail "install.sh"
}

shellcheck_module_travis() {
  shellcheck test.sh
  shellcheck -x repl
  shellcheck repl_modules
  shellcheck language_support.sh
  shellcheck -e SC2034,SC2148 config
  shellcheck -e SC2034,SC2148 config.default
  shellcheck install.sh
}

main() {
  printf 'PRELIMINARY ANALYSIS...\n\n'

  if ! type "shellcheck" > /dev/null 2>&1; then
    printf 'Error: shellcheck is not installed\n'
    printf 'Please install shellcheck first then try again\n'
    exit 1
  fi

  if [ -z "${TRAVIS}" ]; then
    shellcheck_module
  else
    # The Travis CI version does not exit immediately on error
    shellcheck_module_travis
  fi

  shellcheck_pass

  printf '###################\n\n'
  printf 'SHUNIT2-TESTING...\n\n'

  bash "./test/main_test.sh"

  # Does not print in Travis CI builds
  if [ -z "${TRAVIS}" ]; then
    printf 'Nice, %s, all tests are passing!\n' "$(git config user.name)"
  fi
}

main
