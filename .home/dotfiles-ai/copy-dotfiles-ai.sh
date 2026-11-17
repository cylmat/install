#!/usr/bin/env bash

# Copie le contenu de ~/dotfiles-ai vers le répertoire courant.
# Exclus : .git, secrets (.env*), fichiers de sauvegarde (*.bak*) et fichiers locaux (*.local).
# set -e (quitte si fail) -u (pas de variables non définie) -o pipefail (retourne le code de sortie d'un fail)
set -euo pipefail

src="$HOME/dotfiles-ai"
dest="$PWD"

[[ -d "$src" ]] || { echo "Source introuvable : $src" >&2; exit 1; }
[[ "$(cd "$src" && pwd -P)" != "$(pwd -P)" ]] || { echo "Source et destination identiques, rien à faire." >&2; exit 1; }

tar -C "$src" --exclude='.git' --exclude='.env*' --exclude='*.bak*' --exclude='*.local' -cf - . | tar -C "$dest" -xf -

echo "Copié : $src -> $dest"
