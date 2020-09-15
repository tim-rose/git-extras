#!/bin/sh
#
# GIT-RM-BRANCH --Remove a local branch and its remote tracking branch.
#
# Remarks:
# TODO: automatically determine remote tracking branch!
#
. midden
require getopt 
require log 

#
# usage() --echo this script's usage message.
#
usage()
{
    cat <<EOF
git-rm-branch: remove a local git branch and its remote on origin.
EOF
    getopt_usage "git-rm-branch branches..." "$1"
}

opts="$LOG_GETOPTS"
eval $(getopt_long_args -d "$opts" "$@" || usage "$opts" >&2)
log_getopts

if [ $# -lt 1 ]; then
    log_quit 'you must specify some branches to remove'
fi

for branch; do
    if log_cmd git branch -D $branch; then
        log_cmd git push origin :$branch
    fi
done
