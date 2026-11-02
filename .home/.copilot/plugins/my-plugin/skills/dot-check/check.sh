#!/usr/bin/env bash
# Verify that every non-blank line of each PHP file ends with ";".
# Usage: check.sh [path...]   (default: current directory)
set -u

targets=("$@")
[ ${#targets[@]} -eq 0 ] && targets=(.)

files=$(find "${targets[@]}" \( -name .git -o -name vendor -o -name node_modules -o -name .trees \) -prune \
  -o -type f -name '*.php' -print)

status=0
count=0
while IFS= read -r f; do
  [ -z "$f" ] && continue
  count=$((count + 1))
  bad=$(awk '{
    sub(/\r$/, "")
    sub(/[ \t]+$/, "")
    if ($0 != "" && substr($0, length($0), 1) != ";")
      printf "  line %d: %s\n", NR, $0
  }' "$f")
  if [ -n "$bad" ]; then
    status=1
    printf 'ERROR | FAIL %s\n' "$f"
    while IFS= read -r line; do
      printf 'ERROR | %s\n' "$line"
    done <<< "$bad"
  fi
done <<< "$files"

if [ "$count" -eq 0 ]; then
  echo "No PHP files found."
  exit 0
fi

if [ "$status" -eq 0 ]; then
  echo "OK: $count PHP file(s), every non-blank line ends with ';'."
else
  echo "ERROR | Checked $count PHP file(s): violations found."
fi
exit $status
