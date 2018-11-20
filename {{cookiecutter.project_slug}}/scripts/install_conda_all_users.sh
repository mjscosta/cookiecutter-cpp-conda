#!/usr/bin/env bash

# TODO: this required to edit the script when the version changed due to md5 check.
CONDA_VER="4.5.11"

usage() {
  echo "$(basename $0)" "-c conda_username"
  echo
  echo "-c conda_username - username for which conda will install, allowing the user to \
add packages to the root environment" >&2
  exit 1
}

while getopts ":u:" opt; do
  case $opt in
    u) CONDA_USER="$OPTARG"
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

if [ -z "$CONDA_USER" ]; then usage ; fi

CONDA_HOME=/opt/conda

# Get Miniconda3 and make it the main Python interpreter
if [ ! -d $CONDA_HOME ]; then
    curl -s -L https://repo.continuum.io/miniconda/Miniconda3-${CONDA_VER}-Linux-x86_64.sh > miniconda.sh && \
    openssl md5 miniconda.sh | grep 458324438b7b0e5afcc272b63d44195d && \
    bash miniconda.sh -b -p $CONDA_HOME && \
    rm miniconda.sh && \
    touch $CONDA_HOME/conda-meta/pinned && \
    ln -s $CONDA_HOME/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    export PATH=$CONDA_HOME/bin:$PATH && \
    conda config --set show_channel_urls True && \
    conda config --append channels conda-forge && \
    conda config --append channels defaults && \
    conda update --all --yes && \
    conda clean -tipy
else
    echo "Miniconda is already installed in $CONDA_HOME"
fi

# change user permissions to be able to do stuff in the conda
chown -R $CONDA_USER:$CONDA_USER $CONDA_HOME

