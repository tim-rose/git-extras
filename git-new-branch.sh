#!/bin/sh
#
# GIT-NEW-BRANCH --Create a new branch and setup a remote tracking branch.
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
git-new-branch: create a new local branch and remote tracking branch
EOF
    getopt_usage "git-new-branch [-u upstream] branches..." "$1"
}

opts="u.upstream=origin;$LOG_GETOPTS"
eval $(getopt_long_args -d "$opts" "$@" || usage "$opts" >&2)
log_getopts

if [ $# -lt 1 ]; then
    log_quit 'you must specify some branches to create'
fi

local_branch_exists() { git branch | grep -sw $1 > /dev/null; }
remote_branch_exists() { git ls-remote --heads | grep -sw $1 > /dev/null; }

status=0
for branch; do
    if local_branch_exists $branch; then
        warning 'branch "%s" already exists' $branch
        status=1
        continue
    fi

    if remote_branch_exists $branch; then
        info 'branch "%s" will track existing branch "%s/%s"' $branch $upstream $branch
        log_cmd git fetch $upstream 
        log_cmd git checkout -b $branch --track $upstream/$branch
        log_cmd git pull $upstream $branch
    else 
        info 'creating new branches: "%s", "origin/%s"' $branch $branch
        log_cmd git checkout -b $branch 
        log_cmd git push $upstream $branch
    fi 
done
exit $status
