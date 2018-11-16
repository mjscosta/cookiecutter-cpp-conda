#!/bin/bash
# @author: Mario Costa
# @date: 15/11/2018

# Ubunto development environment bootstrap script

#------------------------------------------------------------------------------
#            NOTE: DO NOT ADD LIBRARY DEPENDENCIES TO THIS FILE
#------------------------------------------------------------------------------


#------------------------------------------------------------------------------
# Add here alpine specific tools that are not available via anaconda cloud 
# packages.
#
# https://pkgs.alpinelinux.org/packages
#------------------------------------------------------------------------------

apk add lcov 
apk add gcovr
