#!/bin/bash
#
# GIT-BLEND --Do a git non-fast-forward merge.
#
# Remarks:
# TODO: get git-blend working!
#
. midden
require getopt 
require log

stash=
tmpfile=$(mktemp -t vcs-XXXXXX)
trap 'rm -f "$tmpfile"' EXIT

#
# usage() --echo this script's usage message.
#
usage()
{
    cat <<EOF
git-blend: Do a "safe" merge to the current branch.
EOF
    getopt_usage "git-blend [options] <branch>" "$1"
}

opts="$LOG_GETOPTS"
eval $(getopt_long_args -d "$opts" "$@" || usage "$opts" >&2)
log_getopts

if [ $# -ne 1 ]; then
    err 'no branch specified'
    usage
    exit 2
fi

#
# main...
#
if ! current_branch=$(git-describe --contains --all HEAD); then
    log_quit 'Not a git repository'
fi

current_sha=$(git-rev-parse HEAD)

target_branch=$1
target_sha=$(git-rev-parse $target_branch)

if [ "$current_sha" = "$target_sha" ]; then
    notice 'Branch "%s" has no new commits' "$target_branch"
    exit 0
fi

base_sha=$(git-merge-base $current_sha $target_sha)
n_commits=$(git-rev-list $base_sha $target_sha)

info 'Branch "%s" has %d new commits' "$target_branch" "$n_commits"

#
# report on how current as diverged from base
#
n_commits=$(git-rev-list $base_sha $current_sha)
info 'Branch "%s" has %d new commits since "%s" diverged.' \
    "$current_branch" "$n_commits" "$target_branch"

# stash if necessary
# merge, no fast-forward
# restore stash

log_quit 'Not implemented yet!'

