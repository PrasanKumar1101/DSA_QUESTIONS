#!/usr/bin/env bash
# Spin up a new approach file for the current problem: copies the open solution
# file to the next "approach-N.<ext>" in the same folder and opens it in VS Code.
# Usage:  bash tooling/new-approach.sh <path/to/current-solution-file>
set -uo pipefail

FILE="${1:-}"
if [[ -z "$FILE" || ! -f "$FILE" ]]; then
  echo "✘ usage: new-approach.sh <current-solution-file>"; exit 1
fi
FILE="$(realpath "$FILE")"
FOLDER="$(dirname "$FILE")"
EXT="${FILE##*.}"

# next index = (# of source files of this ext already here) + 1, skipping any clash
COUNT="$(find "$FOLDER" -maxdepth 1 -type f -name "*.${EXT}" | wc -l)"
N=$((COUNT + 1))
NEW="$FOLDER/approach-${N}.${EXT}"
while [[ -e "$NEW" ]]; do N=$((N + 1)); NEW="$FOLDER/approach-${N}.${EXT}"; done

cp "$FILE" "$NEW"
printf "\033[32m✔ created %s\033[0m (copied from %s — edit it, then Ctrl+Alt+R to test / Ctrl+Alt+S to submit)\n" \
  "$(basename "$NEW")" "$(basename "$FILE")"

# open in the running VS Code window (no-op if 'code' isn't on PATH)
if command -v code >/dev/null 2>&1; then
  code -r "$NEW" >/dev/null 2>&1 || true
fi
