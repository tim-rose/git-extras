#!/bin/sh
#
# GIT-URL --Show the URL of a git repository
#
cd ${1:-.} && git config --list | sed -ne '/^remote.origin.url/s/.*=//p'
