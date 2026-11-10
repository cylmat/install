---
name: doctrine-change
description: Modifier une entité Doctrine avec migration générée par doctrine:migrations:diff, relecture de la migration (colonnes, index, down()) et analyse d'impact sur les requêtes. Utiliser pour toute évolution de schéma.
---

# Modification d'entité Doctrine

## 1. Découvrir l'existant
- Repérer le mapping : attributs `#[ORM\...]` ou XML/YAML (`grep -rn "ORM\\\\Entity" src/ | head`).
- Repérer la config de migrations (`config/packages/doctrine_migrations.yaml`) et le dossier de migrations.
- Repérer le service PHP dans `docker-compose*.yml` et la commande d'exécution (`docker compose exec <service>` si Docker est utilisé).

## 2. Modifier l'entité
- Changement minimal : seulement les propriétés et annotations demandées.
- Typer les propriétés, déclarer les index et contraintes au mapping (`#[ORM\Index]`, `#[ORM\UniqueConstraint]`), pas à la main dans la migration.
- Vérifier les valeurs par défaut pour les colonnes non nullables sur une table déjà peuplée.

## 3. Générer la migration
- Ne jamais écrire la migration à la main : `doctrine:migrations:diff` (via `docker compose exec` si applicable).
- Si le diff est vide, le dire. Ne pas forcer.

## 4. Relire la migration (obligatoire)
Contrôler point par point :
- Colonnes : type, nullabilité, longueur, défaut. Un `DROP COLUMN` ou un changement de type restrictif est un signal d'alerte : le signaler.
- Index et contraintes : présents, nommés, pas de doublon avec un index existant.
- `down()` : doit réellement annuler `up()`. Si ce n'est pas possible (perte de données), l'indiquer explicitement.
- Données existantes : une colonne non nullable ajoutée sans défaut casse une table peuplée. Prévoir un `UPDATE` ou un défaut.
- Ne pas exécuter `doctrine:migrations:migrate` sur une base partagée ou de prod sans demande explicite.

## 5. Impact sur les requêtes
- Chercher les usages du champ modifié : `grep -rn "<champ>" src/`.
- Repérer les DQL/QueryBuilder touchés, vérifier les N+1 (jointures manquantes, `EXTRA_LAZY`, fetch joins).
- Si un index est ajouté, vérifier qu'il couvre la requête visée (`EXPLAIN` sur un environnement de test uniquement).

## 6. Vérifier
- Lancer les tests ciblés et l'analyse statique découverts dans le repo.
- Résumer : fichiers touchés, SQL de la migration, risques restants.
