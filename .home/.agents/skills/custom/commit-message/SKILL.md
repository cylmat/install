---
name: commit-message
description: Propose un message de commit à partir des changements Git. À utiliser quand on demande un message de commit ou un résumé des modifications.
---

# Rédiger un message de commit

1. Examine les changements avec `git diff` et, si nécessaire, `git status`.
2. Résume leur intention principale, sans inventer de détails.
3. Propose un message concis selon le format Conventional Commits :
   `<type>(<scope>): <description>`
4. Utilise l’impératif et commence la description par une minuscule.
5. Si les changements couvrent plusieurs sujets distincts, signale-le et propose de les séparer en plusieurs commits.
6. Ne crée pas le commit : donne uniquement le message proposé.

Types courants : `feat`, `fix`, `docs`, `refactor`, `test`, `chore`.