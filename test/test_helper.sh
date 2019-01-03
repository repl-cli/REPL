# shellcheck shell=bash

#######################################
# Run repl and hide the output
# Globals:
#   None
# Arguments:
#   $@ - All the oparands passed to `repl`
# Returns:
#   None
#######################################
repl_command() {
  ./bin/repl "$@" > /dev/null 2>&1
}

#######################################
# Update a line in the config file.
# Globals:
#   None
# Arguments:
#   $1 - Variable to update (e.g., "LAST_RUN=") [MUST include equals sign, no leading/trailing spaces]
#   $2 - Value to update variable with (e.g., "cpp" for LAST_RUN=) [no leading/trailing spaces]
# Returns:
#   None
#######################################
repl_update_config() {
  local SCRIPTPATH
  SCRIPTPATH="$( cd "$(dirname "$0")/.." || exit ; pwd -P )"

  sed -i'' -e "s@^\($1\).*@\1\"$2\"@" "${SCRIPTPATH}/config"
}
