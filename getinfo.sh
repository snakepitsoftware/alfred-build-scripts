#!/bin/zsh

if [ ! -f info.plist ]; then
  echo "plist file not found."
  exit 1
fi

BUNDLEID=$(defaults read $(pwd)/info.plist bundleid 2&>/dev/null)
if [ -z ${BUNDLEID} ]; then
  echo "bundleid not found."
  exit 2
fi

echo "${BUNDLEID}"

NAME=$(defaults read $(pwd)/info.plist name 2&>/dev/null)
if [ -z ${NAME} ]; then
  echo "name not found."
  exit 2
fi

echo "${NAME}"

