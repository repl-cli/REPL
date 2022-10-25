#!/bin/bash

. "./test/test_helper.sh"

oneTimeSetUp() {
  if [ ! -e repl_tmp ]; then
    mkdir ./repl_tmp
  fi
  cat config.default > config
}

oneTimeTearDown() {
  cat config.default > config
  rm -rf ./repl_tmp
}

setUp() {
  cat config.default > config
  repl_update_config "EDITOR=" "ls"
  repl_update_config "TMP=" "repl_tmp"
}

assert_repl_run() {
  assertContains "$(bin/repl run)" "Hello world!"
}

## TESTS

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

test_cs_module() {
  repl_command cs
  assertContains "$(ls repl_tmp/)" "repl.cs"

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

test_ts_module() {
  repl_command ts
  assertContains "$(ls repl_tmp/)" "repl.ts"

  assert_repl_run
}

test_go_module() {
  repl_command go
  assertContains "$(ls repl_tmp/)" "repl.go"

  assert_repl_run
}

. "./test/libs/shunit2/shunit2"
