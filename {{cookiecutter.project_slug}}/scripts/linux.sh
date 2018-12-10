#!/usr/bin/env bash
# @author: Mario Costa
# @date: 20/11/2018

usage() {
  echo "$(basename $0)" "[-c conda_username]"
  echo
  echo "-c conda_username - username for which conda will install, allowing the user to \
add packages to the root environment. root if none is defined." >&2
  exit 1
}

while getopts ":c:" opt; do
  case $opt in
    c) CONDA_USER="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      usage
      ;;
  esac
done
shift $((OPTIND-1))

INSTALL_CONTDA_ARGS_=""


if [ ! -z "$CONDA_USER" ]; then INSTALL_CONTDA_ARGS_="$INSTALL_CONTDA_ARGS_ -u $CONDA_USER" ; fi

#------------------------------------------------------------------------------
# Get Current Script Source Dir. This Macro Needs to Duplicated ...
#------------------------------------------------------------------------------

# get this script source folder. Make sure remaining scripts are in the same
# source folder.

# source: https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within

SOURCE_="${BASH_SOURCE[0]}"

# resolve $SOURCE until the file is no longer a symlink
while [ -h "$SOURCE_" ]; do
  DIR_="$( cd -P "$( dirname "$SOURCE_" )" >/dev/null && pwd )"
  SOURCE_="$(readlink "$SOURCE_")"

  # if $SOURCE was a relative symlink, we need to resolve it relative to the 
  # path where the symlink file was located
  [[ $SOURCE_ != /* ]] && SOURCE="$DIR_/$SOURCE_"
done
DIR_="$( cd -P "$( dirname "$SOURCE_" )" >/dev/null && pwd )"

#------------------------------------------------------------------------------
# Add Here Generic Linux Provisioning Scripts
#------------------------------------------------------------------------------

$DIR_/install_conda_all_users.sh $INSTALL_CONTDA_ARGS_
