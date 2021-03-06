#!/usr/bin/env bash
# @author: Mario Costa
# @date: 06/11/2018
 
# Ubunto development environment bootstrap script

#------------------------------------------------------------------------------
#            NOTE: DO NOT ADD LIBRARY DEPENDENCIES TO THIS FILE
#------------------------------------------------------------------------------


#------------------------------------------------------------------------------
# Add here specific tools that are not available via anaconda cloud 
# packages.
#------------------------------------------------------------------------------

# common system tools
apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

apt-get install -y clang-format
apt-get install -y lcov gcovr
apt-get install -y gcc-5

#------------------------------------------------------------------------------
# Start Install: docker
#------------------------------------------------------------------------------

# https://docs.docker.com/install/linux/docker-ce/ubuntu/

# if any of the packages below are installed, please remove them
REMOVE_DOCKER_PACKAGES=$(dpkg --get-selections | \
grep -o -P "^(docker|docker-engine|docker.io|containerd|runc)\s")

if [ $? -eq 0 ]
then
  echo "Remove the old packages to install docker ${REMOVE_DOCKER_PACKAGES}"
  exit -1
fi

# if docker repo was not added previously, add it
if [ ! -f /etc/apt/sources.list.d/docker.list ]; then
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

  add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
fi

apt-get install -y docker-ce docker-ce-cli containerd.io
#------------------------------------------------------------------------------
# End Install: docker
#------------------------------------------------------------------------------

