#!/bin/bash
# shellcheck shell=bash
# Run this file to run all the tests, once

shellcheck_fail() {
  local file="$1"

  printf '\n'
  printf 'FAIL: "%s" did not pass shellcheck analysis\n' "$file"
  printf '      Address the issues above and try again.\n'

  exit 1
}

shellcheck_pass() {
  printf 'PASS: shellcheck analysis\n\n'
}

shellcheck_module() {
  shellcheck test.sh || shellcheck_fail "test.sh"
  shellcheck -x repl || shellcheck_fail "repl"
  shellcheck repl_modules.sh || shellcheck_fail "repl_modules.sh"
  shellcheck language_support.sh || shellcheck_fail "language_support.sh"
  shellcheck -e SC2034,SC2148 repl_config || shellcheck_fail "repl_config"
  shellcheck -e SC2034,SC2148 repl_config.default || shellcheck_fail "repl_config.default"
  shellcheck install.sh || shellcheck_fail "install.sh"
}

shellcheck_module_travis() {
  shellcheck test.sh
  shellcheck -x repl
  shellcheck repl_modules.sh
  shellcheck language_support.sh
  shellcheck -e SC2034,SC2148 repl_config
  shellcheck -e SC2034,SC2148 repl_config.default
  shellcheck install.sh
}

main() {
  printf 'PRELIMINARY ANALYSIS...\n\n'

  if ! type "shellcheck" > /dev/null 2>&1; then
    printf 'Error: shellcheck is not installed\n'
    printf 'Please install shellcheck first then try again\n'
    exit 1
  fi

  shellcheck_module

  shellcheck_pass

  printf '###################\n\n'
  printf 'SHUNIT2-TESTING...\n\n'

  bash "./test/main_test.sh"
  printf '\n'
  bash "./test/modules_test.sh"

  printf '\n'
  printf 'Nice, %s, all tests are passing!\n' "$(git config user.name)"
}

main
