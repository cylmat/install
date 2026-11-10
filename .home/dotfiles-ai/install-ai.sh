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

dotfiles_dir="$HOME/.dotfiles-ai"
global_agents_file="agents.global.md"
# printf '@%s/$global_agents_file\n' "$HOME" > "$claude/CLAUDE.md"

# CLAUDE #

claude="$dotfiles_dir/.claude"
mkdir -p "$claude"
link "$dotfiles_dir/claude/agents"        "$claude/agents"
link "$dotfiles_dir/claude/hooks"         "$claude/hooks"
link "$dotfiles_dir/claude/settings.json" "$claude/settings.json"
link "$dotfiles_dir/skills"               "$claude/skills"
link "$dotfiles_dir/$global_agents_file"  "$claude/CLAUDE.md"

# COPILOT #

copilot="$dotfiles_dir/.copilot"
mkdir -p "$copilot"
link "$dotfiles_dir/copilot/agents"       "$copilot/agents"
link "$dotfiles_dir/skills"               "$copilot/skills"
link "$dotfiles_dir/$global_agents_file"  "$copilot/copilot.instructions.md"

# GEMINI #

gemini="$dotfiles_dir/.gemini"
mkdir -p "$gemini"
link "$dotfiles_dir/skills"               "$gemini/skills"
link "$dotfiles_dir/$global_agents_file"  "$gemini/GEMINI.md"

# OPENCODE #
