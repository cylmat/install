---
name: pr-description
description: Rédiger le titre et la description d'une pull request à partir du diff réel (git diff de la branche), selon un format sobre. Utiliser avant d'ouvrir ou de mettre à jour une PR.
---

# Description de PR

## 1. Lire le diff réel
- Branche de base : `git symbolic-ref refs/remotes/origin/HEAD` ou `main`/`master` si absent. Ne pas la supposer sans vérifier.
- `git log <base>..HEAD --oneline` pour l'historique.
- `git diff <base>...HEAD --stat` puis `git diff <base>...HEAD` sur les fichiers pertinents.
- Ne pas se fier aux messages de commit seuls : le diff fait foi.

## 2. Titre
- Format : `<type>(<périmètre>): <résumé à l'impératif>` si le repo suit Conventional Commits (vérifier `git log`). Sinon, phrase courte et claire.
- 72 caractères maximum.

## 3. Corps
```
## Contexte
Pourquoi ce changement (une à trois phrases).

## Changements
- Points clés, pas une liste de chaque fichier.

## Tests
- Commandes exécutées et résultat, ou « non exécuté » avec la raison.

## Points d'attention
- Migrations, breaking changes, config à déployer, risques.
```
- Si le repo a un template `.github/pull_request_template.md`, le suivre à la place.

## 4. Vérifications
- Ne pas affirmer de tests verts sans les avoir lancés.
- Signaler les changements non liés au titre (diff mélangé) : proposer de scinder la PR.
- Ne pas créer la PR sans demande explicite. Si demandé : `gh pr create --title ... --body-file <fichier>`.
