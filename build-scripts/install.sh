#!/bin/zsh

if [ ! -d .git ] || [ ! -f info.plist ]; then
  echo "Doesn't look like a repo."
  exit 1
fi

BUNDLEID=$(defaults read $(pwd)/info.plist bundleid 2&>/dev/null)
if [ -z ${BUNDLEID} ]; then
  echo "bundleid not found."
  exit 2
fi

WORKFLOW=~/Library/Application\ Support/Alfred/Alfred.alfredpreferences/workflows
if [ ! -d ${WORKFLOW} ]; then
  echo "Alfred workflow directory not found."
  exit 3
fi

REPODIR=$(pwd)

echo Creating link to workflow repo ...
pushd ${WORKFLOW} > /dev/null
  if [ -h "${BUNDLEID}" ]; then
    unlink ${BUNDLEID}
  fi
  ln -s "${REPODIR}" ${BUNDLEID}
popd
