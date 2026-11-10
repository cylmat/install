#!/usr/bin/env bash

# set -e (quitte si fail) -u (pas de variables non définie) -o pipefail (retourne le code de sortie d'un fail)
set -euo pipefail

link() {
  local source="$1" target="$2"
  # Skip linking if the target is already a symlink to the source
  [[ -L "$target" && "$(readlink "$target")" == "$source" ]] && return
  rm -rf -- "$target"
  mkdir -p "$(dirname "$target")"
  ln -s "$source" "$target"
}

# printf '@%s/$global_agents_file\n' "$HOME" > "$claude/CLAUDE.md"
global_agents_file="agents.global.md"

# CLAUDE #

claude="$HOME/.claude"
mkdir -p "$claude"
link "$HOME/claude/agents"        "$claude/agents"
link "$HOME/claude/hooks"         "$claude/hooks"
link "$HOME/claude/settings.json" "$claude/settings.json"
link "$HOME/skills"               "$claude/skills"
link "$HOME/$global_agents_file"  "$claude/CLAUDE.md"

# COPILOT #

copilot="$HOME/.copilot"
mkdir -p "$copilot"
link "$HOME/copilot/agents"      "$copilot/agents"
link "$HOME/skills"              "$copilot/skills"
link "$HOME/$global_agents_file" "$copilot/copilot.instructions.md"

# GEMINI #

gemini="$HOME/.gemini"
mkdir -p "$gemini"
link "$HOME/skills" "$gemini/skills"
link "$HOME/$global_agents_file" "$gemini/GEMINI.md"

# OPENCODE #
