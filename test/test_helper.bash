# shellcheck shell=bash

repl_update_config() {
  local SCRIPTPATH
  SCRIPTPATH="$( cd "$(dirname "$0")/.." || exit ; pwd -P )"

  sed -i "s@^\($1\).*@\1\"$2\"@" "${SCRIPTPATH}/config"
}
