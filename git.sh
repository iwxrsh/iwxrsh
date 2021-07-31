#!/usr/bin/env bash

GREEN="\x1b[32m"
RED="\x1b[31m"
ORANGE="$RED\x1b[33m"
RESET="\x1b[0m"

function warn {
  printf "(${ORANGE}Warn${RESET}): $1"
}

function info {
  printf "(${GREEN}Info${RESET}): $1"
}

function error {
  printf "${RED}(Err!${RESET}): $1"
}

if [ ! -d "$PWD/.git" ] ; then
  error "Not a Git directory"
fi

COMMIT_MSG=""
REMOTE_NAME="${2:-origin}"
BRANCH_NAME="${3:-main}"

if [ ! "$#" -eq "0" ] ; then
  COMMIT_MSG="$1"
else
  warn "No commit message passed\n"
  info "Please enter a commit message\n"
  info "Message: "

  read -p "" msg
  COMMIT_MSG="$msg"
fi

info "Adding changes...\n"
git add .
git commit -m "$COMMIT_MSG" &> /dev/null
info "Done\n"

info "Pushing changes...\n"
git push "$REMOTE_NAME" "$BRANCH_NAME" &> /dev/null
info "Done\n"