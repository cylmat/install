#!/usr/bin/env bash
# PostToolUse (Edit|Write) : formate le fichier modifié seulement si l'outil ET sa config existent dans le repo.
# Absence de config ou d'outil : rien ne se passe, sortie 0. N'échoue jamais le tour.
set -uo pipefail

file="$(jq -r '.tool_input.file_path // empty' 2>/dev/null)"
[[ -n "$file" && -f "$file" ]] || exit 0

# Racine du projet : git si disponible, sinon dossier du fichier.
dir="$(dirname "$file")"
root="$(git -C "$dir" rev-parse --show-toplevel 2>/dev/null || echo "$dir")"

shopt -s nullglob
case "$file" in
  *.php)
    cfg=( "$root"/.php-cs-fixer* )
    bin="$root/vendor/bin/php-cs-fixer"
    if (( ${#cfg[@]} )) && [[ -x "$bin" ]]; then
      "$bin" fix --quiet "$file" >/dev/null 2>&1 || true
    fi
    ;;
  *.ts|*.tsx|*.js|*.jsx)
    prettier_cfg=( "$root"/.prettierrc* )
    eslint_cfg=( "$root"/eslint.config.* "$root"/.eslintrc* )
    if (( ${#prettier_cfg[@]} )) && [[ -x "$root/node_modules/.bin/prettier" ]]; then
      "$root/node_modules/.bin/prettier" --write --log-level silent "$file" >/dev/null 2>&1 || true
    fi
    if (( ${#eslint_cfg[@]} )) && [[ -x "$root/node_modules/.bin/eslint" ]]; then
      "$root/node_modules/.bin/eslint" --fix --quiet "$file" >/dev/null 2>&1 || true
    fi
    ;;
esac
exit 0
