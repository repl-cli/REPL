# shellcheck shell=bash

# Modules are listed in alphabetical order

# Modules with boilerplate code MUST print EXACTLY "Hello world!" to the console

# TODO: Exit if the runtime/compiler is not found

repl_c() {
  case $1 in
  edit)
    if [ ! -e "$2" ]; then
      cd "${TMP}" && \
        touch "repl.c" && \
        {
          printf '#include <stdio.h>\n\n';
          printf 'int main(void) {\n';
          printf '  printf("Hello world!\\n");\n';
          printf '  return 0;\n';
          printf '}\n';
        } >> "repl.c"
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
      cd "${TMP}" && \
        touch "repl.cpp" && \
        {
          printf '#include <iostream>\n\n';
          printf 'using namespace std;\n\n';
          printf 'int main() {\n';
          printf '  cout << "Hello world!" << endl;\n';
          printf '  return 0;\n';
          printf '}\n';
        } >> "repl.cpp"
    fi
    ;;
  run)
    cd "${TMP}" && \
      $CPP_COMPILER -o repl repl.cpp && \
      ./repl
    ;;
  esac
}

repl_java() {
  case $1 in
  edit)
    if [ ! -e "$2" ]; then
      cd "${TMP}" && \
        touch "repl.java" && \
        {
          printf 'public class repl {\n';
          printf '    public static void main(String[] args) {\n';
          printf '        System.out.println("Hello world!");\n';
          printf '    }\n';
          printf '}\n'
        } >> "repl.java"
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
      cd "${TMP}" && \
        touch "repl.js"
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
      cd "${TMP}" && \
        touch "repl.py"
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
      cd "${TMP}" && \
        touch "repl.rb"
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
      cd "${TMP}" && \
        touch "repl.rs" && \
        {
          printf 'fn main() {\n';
          printf '  println!("Hello world!");\n';
          printf '}\n';
        } >> "repl.rs"
    fi
    ;;
  run)
    cd "${TMP}" && \
      "$RUST_COMPILER" "repl.rs" && \
      ./repl
    ;;
  esac
}
