# shellcheck shell=bash

# Modules are listed in alphabetical order
# Modules with boilerplate code MUST print EXACTLY "Hello world!" to the console

# TODO: Exit if the runtime/compiler is not found

SCRIPTPATH="$( cd "$(dirname "$0")" || exit ; pwd -P )"

repl_c() {
  case $1 in
  edit)
    if [ ! -e "$2" ]; then
      cp "$SCRIPTPATH/../modules/boilerplates/repl.c" "${TMP}/"
    fi
    ;;
  run)
    cd "${TMP}" && \
      $C_COMPILER -o repl repl.c && \
      ./repl
    ;;
  esac
}

repl_cpp() {
  case $1 in
  edit)
    if [ ! -e "$2" ]; then
      cp "$SCRIPTPATH/../modules/boilerplates/repl.cpp" "${TMP}/"
    fi
    ;;
  run)
    cd "${TMP}" && \
      $CPP_COMPILER -o repl repl.cpp && \
      ./repl
    ;;
  esac
}

repl_cs() {
  case $1 in
  edit)
    if [ ! -e "$2" ]; then
      cp "$SCRIPTPATH/../modules/boilerplates/repl.cs" "${TMP}/"
    fi
    ;;
  run)
    cd "${TMP}" && \
      $CS_COMPILER repl.cs && \
      ./repl
    ;;
  esac
}

repl_java() {
  case $1 in
  edit)
    if [ ! -e "$2" ]; then
      cp "$SCRIPTPATH/../modules/boilerplates/repl.java" "${TMP}/"
    fi
    ;;
  run)
    cd "${TMP}" && \
      $JAVA_COMPILER repl.java && \
      java repl
    ;;
  esac
}

repl_js() {
  case $1 in
  edit)
    if [ ! -e "$2" ]; then
      cp "$SCRIPTPATH/../modules/boilerplates/repl.js" "${TMP}/"
    fi
    ;;
  run)
    $NODE "${TMP}/repl.js"
    ;;
  esac
}

repl_py() {
  case $1 in
  edit)
    if [ ! -e "$2" ]; then
      cp "$SCRIPTPATH/../modules/boilerplates/repl.py" "${TMP}/"
    fi
    ;;
  run)
    "$PYTHON" "${TMP}/repl.py"
    ;;
  esac
}

repl_rb() {
  case $1 in
  edit)
    if [ ! -e "$2" ]; then
      cp "$SCRIPTPATH/../modules/boilerplates/repl.rb" "${TMP}/"
    fi
    ;;
  run)
    "$RUBY" "${TMP}/repl.rb"
    ;;
  esac
}

repl_rs() {
  case "$1" in
  edit)
    if [ ! -e "$2" ]; then
      cp "$SCRIPTPATH/../modules/boilerplates/repl.rs" "${TMP}/"
    fi
    ;;
  run)
    cd "${TMP}" && \
      "$RUST_COMPILER" "repl.rs" && \
      ./repl
    ;;
  esac
}

repl_ts() {
  case "$1" in
  edit)
    if [ ! -e "$2" ]; then
      cp "$SCRIPTPATH/../modules/boilerplates/repl.ts" "${TMP}/"
    fi
    ;;
  run)
    cd "${TMP}" && \
      "$TYPESCRIPT_COMPILER" "repl.ts" && \
      $NODE "repl.js"
    ;;
  esac
}

repl_go() {
  case $1 in
  edit)
    if [ ! -e "$2" ]; then
      cp "$SCRIPTPATH/../modules/boilerplates/repl.go" "${TMP}/"
    fi
    ;;
  run)
    $GO_COMPILER run "${TMP}/repl.go"
    ;;
  esac
}