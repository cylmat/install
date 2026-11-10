---
name: ci-debug
description: Diagnostiquer un échec de CI GitHub Actions avec gh (run list, run view --log-failed), identifier la cause et proposer un correctif. Utiliser quand une CI est rouge.
---

# Diagnostic CI GitHub Actions

## 1. Identifier le run
- Sur la branche courante : `gh run list --branch "$(git branch --show-current)" --limit 5`
- Sur une PR : `gh pr checks <numéro>` puis `gh run view <id>`.
- Si `gh` n'est pas authentifié, le dire et s'arrêter : ne jamais demander ou afficher un token.

## 2. Lire les logs d'échec
- `gh run view <id> --log-failed` (logs des étapes en échec uniquement).
- Si la sortie est trop longue, filtrer : `| tail -n 200` ou `| grep -i -E "error|fail|exception" | head -n 50`.
- Lire le workflow concerné dans `.github/workflows/` pour comprendre les étapes et les variables.

## 3. Classer la cause
- **Code** : test rouge, erreur de lint ou de typage. Reproduire localement avec les commandes découvertes dans le repo.
- **Environnement** : image Docker, version de runtime, service manquant, variable absente. Comparer avec le workflow.
- **Secret ou permission** : secret absent, token expiré, permission `GITHUB_TOKEN` insuffisante. Ne jamais afficher la valeur du secret, seulement son nom.
- **Flaky** : échec non reproductible. Relancer une fois avec `gh run rerun <id> --failed` seulement si demandé, et le signaler.

## 4. Correctif
- Corriger la cause, pas le symptôme. Pas de `continue-on-error` ni de skip de test pour masquer un échec.
- Diff minimal. Reproduire en local avant de pousser.
- Ne pas pousser sans demande explicite.

## 5. Rapport
- Run ID, job et étape en échec, ligne d'erreur clé, cause classée, correctif proposé.
