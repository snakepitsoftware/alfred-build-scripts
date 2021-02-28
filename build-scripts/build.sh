#!/bin/zsh

if [ ! -d .git ] || [ ! -f info.plist ]; then
  echo "Doesn't look like a repo."
  exit 1
fi

NAME=$(defaults read $(pwd)/info.plist name 2&>/dev/null)
if [ -z ${NAME} ]; then
  echo "name not found."
  exit 2
fi

FILES=("LICENSE" "README.md" "CHANGELOG.md" "info.plist" "icon.png")
WORKFLOW=${NAME}".alfredworkflow"

if [ -f "$WORKFLOW" ]; then
  unlink $WORKFLOW
fi

echo Creating \"${WORKFLOW}\" ...
zip --junk-paths "$WORKFLOW" ${FILES[@]}

