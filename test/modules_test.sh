#!/bin/bash

. "./test/test_helper.sh"

oneTimeSetUp() {
  if [ ! -e repl_tmp ]; then
    mkdir ./repl_tmp
  fi
  cat repl_config.default > repl_config
}

oneTimeTearDown() {
  cat repl_config.default > repl_config
  rm -rf ./repl_tmp
}

setUp() {
  cat repl_config.default > repl_config
  repl_update_config "EDITOR=" "type"
  repl_update_config "TMP=" "repl_tmp"
}

assert_repl_run() {
  assertContains "$(repl run)" "Hello world!"
}

## Tests

test_c_module() {
  repl_command c
  assertContains "$(ls repl_tmp/)" "repl.c"

  assert_repl_run
}

test_cpp_module() {
  repl_command cpp
  assertContains "$(ls repl_tmp/)" "repl.cpp"

  assert_repl_run
}

test_java_module() {
  repl_command java
  assertContains "$(ls repl_tmp/)" "repl.java"

  assert_repl_run
}

test_js_module() {
  repl_command js
  assertContains "$(ls repl_tmp/)" "repl.js"

  echo "console.log('Hello world!');" > repl_tmp/repl.js
  assertContains "$(cat repl_tmp/repl.js)" "'Hello world!'"

  assert_repl_run
}

test_py_module() {
  repl_command py
  assertContains "$(ls repl_tmp/)" "repl.py"

  echo "print(\"Hello world!\")" > repl_tmp/repl.py
  assertContains "$(cat repl_tmp/repl.py)" "Hello world!"

  assert_repl_run
}

test_rb_module() {
  repl_command rb
  assertContains "$(ls repl_tmp/)" "repl.rb"

  echo "puts 'Hello world!'" > repl_tmp/repl.rb
  assertContains "$(cat repl_tmp/repl.rb)" "Hello world!"

  assert_repl_run
}

test_rs_module() {
  repl_command rs
  assertContains "$(ls repl_tmp/)" "repl.rs"

  assert_repl_run
}

. "./test/libs/shunit2/shunit2"
