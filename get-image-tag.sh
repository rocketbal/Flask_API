#!/bin/bash
#// Image taggin shell script obtained from : https://nicd.ncl.ac.uk/blog/posts/continuous-application-deployment-with-aws-and-kubernetes/
REPO_URL=$1

if [[ -z $REPO_URL ]] ; then
    echo "Missing repository URL" >&2
    exit 1
fi

COMMIT_ID=$2

if [[ -z $COMMIT_ID ]] ; then
    echo "Missing commit ID" >&2
    exit 1
fi

TEMP_DIR="$(mktemp -d)"

echo "Temp dir: $TEMP_DIR" >&2

git clone "$REPO_URL" "$TEMP_DIR"
cd "$TEMP_DIR"
git fetch --tags

TAG_NAME=$(git tag --points-at "$COMMIT_ID")

echo "Tag name is: $TAG_NAME" >&2
if [[ $TAG_NAME == v* ]]; then
    echo $TAG_NAME | cut -c 2-
else
    echo $COMMIT_ID | cut -c 1-10
fi
