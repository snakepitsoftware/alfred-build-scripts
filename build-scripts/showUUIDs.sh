#!/bin/zsh

if [ ! -f info.plist ]; then
  echo "plist file not found."
  exit 1
fi

REGEX=[a-fA-F0-9]{8}-([a-fA-F0-9]{4}-){3}[a-fA-F0-9]{12}

UUIDS=$(cat info.plist | grep -oE ${REGEX} | sort -u)

while IFS= read -r UUID ; do
  echo ${UUID}
done <<< "$UUIDS"

