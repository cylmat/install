---
name: my
description: Afficher mes propres skills personnels (dans ~/dotfiles-ai/skills) et mes agents par IA (Claude, Copilot, Gemini, OpenCode) avec leur nom et leur description. Utiliser quand on demande "mes skills", "quels skills j'ai", "liste mes skills", "mes agents", "quels agents j'ai".
allowed-tools: Bash(cd:*), Bash(awk:*), Bash(for:*), Bash(test:*)
---

# Mes skills et mes agents

Lister les skills personnels de l'utilisateur (`~/dotfiles-ai/skills/`) et ses agents par IA. Ne pas inclure les dossiers `skills.bak.*` ni les skills de plugins.

## Étapes

1. Lister les skills. Exécuter la commande suivante, qui lit le `name:` et la `description:` du frontmatter de chaque `SKILL.md` :

   ```bash
   cd ~/dotfiles-ai/skills && for f in */SKILL.md; do n=$(awk -F': *' '/^name:/{print $2; exit}' "$f"); d=$(awk -F': *' '/^description:/{sub(/^description: */,""); print; exit}' "$f"); echo "${n:-<name manquant>} | ${d:0:120}"; done | sort
   ```

2. Lister les agents. Exécuter la commande suivante, qui parcourt les dossiers d'agents de chaque IA. Un dossier absent est signalé « (dossier absent) », sans erreur :

   ```bash
   for dir in "$HOME/.claude/agents" "$HOME/.copilot/agents" "$HOME/.gemini/agents" "$HOME/.config/opencode/agent" "$HOME/.config/opencode/agents"; do echo "== $dir"; if [ -d "$dir" ]; then found=0; for f in "$dir"/*.md; do [ -e "$f" ] || continue; found=1; base=$(basename "$f"); base=${base%.agent.md}; base=${base%.md}; n=$(awk -F': *' '/^name:/{print $2; exit}' "$f"); ds=$(awk -F': *' '/^description:/{sub(/^description: */,""); print; exit}' "$f"); echo "${n:-$base} | ${ds:0:120}"; done; [ "$found" -eq 0 ] && echo "(aucun agent)"; else echo "(dossier absent)"; fi; done
   ```

3. Si une ligne de skill affiche `<name manquant>`, le signaler dans la réponse plutôt que de l'omettre.
4. Afficher les skills sous forme de tableau (Skill | Description), description tronquée à une phrase si besoin.
5. Afficher les agents groupés par IA, dans un tableau par IA (Agent | Description). Pour une IA dont le dossier est absent ou vide, l'indiquer en une ligne (« aucun agent », avec le chemin vérifié).
6. Terminer par le nombre total de skills, le nombre total d'agents, et le chemin du dossier `~/dotfiles-ai/skills`. Pas de commentaire supplémentaire, aucune modification de fichier.
