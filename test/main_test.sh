#!/bin/bash

test_status() {
  local status

  status=$(./bin/repl status)

  assertEquals "status: should not fail" "$status" "repl: No current repl"
}

. "./test/libs/shunit2/shunit2"
