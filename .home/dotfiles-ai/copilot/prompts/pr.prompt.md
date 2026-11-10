---
description: Rédige le titre et la description de PR à partir du diff réel
---

Rédige le titre et la description de la pull request pour la branche courante.

1. Trouve la branche de base (ne la suppose pas) et lis `git log` et `git diff <base>...HEAD`.
2. Titre : court, à l'impératif, 72 caractères max, au format Conventional Commits si le repo le suit.
3. Corps : sections « Contexte », « Changements », « Tests », « Points d'attention ». Si le repo a `.github/pull_request_template.md`, utilise-le.
4. N'affirme aucun test vert sans les avoir lancés. Indique « non exécuté » si besoin.
5. Ne crée pas la PR sans que je le demande.
