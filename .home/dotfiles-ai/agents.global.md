# Préférences globales (tous projets)

Ces règles sont des défauts. Les règles du repo (`AGENTS.md`, `CLAUDE.md`, `.github/copilot-instructions.md`) les complètent et peuvent les contredire : elles priment.

## Découverte avant action
- Ne jamais supposer une commande de test, lint ou build. Lire d'abord `Makefile`, `composer.json`, `package.json`, `docker-compose*.yml`, `.github/workflows/`.
- Ne jamais supposer un chemin, un service Docker ou un contexte Kubernetes : vérifier.
- Si le repo n'a pas de convention claire, le dire plutôt que d'inventer.

## Docker et PHP
- Commandes PHP/Composer via `docker compose exec <service> ...`, jamais sur l'hôte, sauf si le repo prouve le contraire.
- Identifier le service PHP dans `docker-compose*.yml` avant de l'utiliser.

## Doctrine
- Migrations générées avec `doctrine:migrations:diff`, jamais écrites à la main.
- Toujours relire la migration générée : colonnes, index, contraintes, `down()`.
- Avant de modifier une entité, vérifier l'impact sur les requêtes (N+1, index).

## Clients HTTP inter-services
- Clients typés depuis le Swagger/OpenAPI du service distant.
- DTO explicites. Jamais de tableaux anonymes en entrée ou en sortie de client.
- Timeouts et gestion d'erreurs explicites sur chaque appel.
- Tests avec `MockHttpClient`, sans appel réseau réel.

## Définition de terminé
- Lint et analyse statique passent (commandes découvertes dans le repo).
- Tests ciblés verts. Pas de suite complète si elle est lente, sauf demande.
- `tsc` propre pour le TypeScript.
- Sortir la commande exacte lancée et son résultat, pas une affirmation.

## Style de travail
- Réponses concises. Pas de résumé qui répète le diff.
- Diff minimal : pas de refactoring non demandé, pas de renommage opportuniste.
- Signaler les doutes et les hypothèses avant de coder, pas après.
- Ne jamais afficher, copier ou committer un secret (token, `.env`, kubeconfig).

## Sécurité et opérations
- Aucune commande d'écriture sur un cluster Kubernetes sans confirmation explicite.
- Pas de `git push --force`, pas de `docker system prune`, sans demande explicite.
- Commits et PR : seulement sur demande.
