#!/usr/bin/env bash
# PreToolUse (Bash) : bloque kubectl si le contexte courant contient "prod".
# Entrée : JSON sur stdin (tool_input.command). Sortie bloquante : exit 2 + stderr.
set -uo pipefail

input="$(cat)"
command -v jq >/dev/null 2>&1 || exit 0
cmd="$(printf '%s' "$input" | jq -r '.tool_input.command // empty')"

# Ne concerne que les appels kubectl.
case "$cmd" in
  kubectl\ *|*" kubectl "*|*"&& kubectl"*|*"; kubectl"*) ;;
  *) exit 0 ;;
esac

command -v kubectl >/dev/null 2>&1 || exit 0
ctx="$(kubectl config current-context 2>/dev/null || true)"

if [[ "$ctx" == *prod* ]]; then
  echo "Bloqué : contexte kubectl '$ctx' contient 'prod'. Changer de contexte ou demander une confirmation explicite." >&2
  exit 2
fi
exit 0
