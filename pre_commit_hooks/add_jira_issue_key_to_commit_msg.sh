#!/usr/bin/env sh

set -e

eval COMMIT_MSG_FILE=\"\${$#}\"

options=$(getopt -o k: -l key: -n $(basename "$0") -- "$@")

eval set -- "$options"

PROJECT_KEY=ONE

while true; do
    case "$1" in
    msg)
        COMMIT_MSG=$2
        shift
        ;;
    -k | --key)
        PROJECT_KEY=$2
        shift 2
        ;;
    --)
        shift
        break
        ;;
    *)
        shift
        ;;
    esac
done

BRANCH_NAME=$(git symbolic-ref --short HEAD)
ISSUE_KEY=$(echo "$BRANCH_NAME" | grep -oE "^$PROJECT_KEY-[0-9]+" || echo "")

if [ -z "$ISSUE_KEY" ]; then
    exit 0
fi

echo "$ISSUE_KEY: $(cat $COMMIT_MSG_FILE)" >$COMMIT_MSG_FILE
