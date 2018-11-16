#!/bin/bash


if [ -z "$1" ]; then
    CONDA_VER="4.5.11"
else
    CONDA_VER=$1
fi

if [ -z "$2" ]; then
    CONDA_USER="vagrant"
else
    CONDA_USER=$2
fi

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
fi

# change user permissions to be able to do stuff in the conda
chown -R $CONDA_USER:$CONDA_USER $CONDA_HOME

