#!/bin/bash
. "./language_support.sh"

. "./test/test_helper.sh"

oneTimeSetUp() {
  [ -e repl_tmp ] && rm -rf ./repl_tmp
  mkdir ./repl_tmp
}

setUp() {
  cat config.default > config
  repl_update_config "TMP=" "repl_tmp"
  repl_update_config "EDITOR=" "ls"
}

oneTimeTearDown() {
  cat config.default > config
  [ -e ./repl_tmp ] && rm -rf ./repl_tmp
}

## TESTS

test_status() {
  local status
  status=$(./bin/repl status)

  assertEquals "Should display the correct status message for no curent repl" "repl: No current repl" "$status"

  repl_update_config "LAST_RUN=" "js"
  status=$(./bin/repl status)

  assertEquals "Should display the correct status message for non-existent current repl" "repl: No current repl" "$status"

  repl_command js
  status=$(./bin/repl status)

  assertContains "Should display the correct status message for the current repl" "$status" "status: currently in a js repl"
}

test_languages() {
  local languages
  languages=$(./bin/repl languages)

  for language in "${LANGUAGES[@]}"
  do
    assertContains "$languages" "$language"
  done
}

test_edit() {
  repl_update_config "EDITOR=" "thisBinaryDoesNotExist"

  ./bin/repl js &> /dev/null

  assertFalse "Should exit with non-zero status if EDITOR failed to run" "$?"
}

test_config_editor() {
  repl_command config editor cat

  assertEquals "Should successfully update EDITOR in config with existing application" "EDITOR=\"cat\"" "$(grep EDITOR=\"cat\" config)"
}

. "./test/libs/shunit2/shunit2"
