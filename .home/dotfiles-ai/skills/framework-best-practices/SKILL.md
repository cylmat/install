---
name: framework-best-practices
description: Récupérer les bonnes pratiques actuelles des frameworks du repo (Symfony, Doctrine, React, TypeScript, Docker, GitHub Actions) avant d'écrire du code, via la documentation officielle (URL). Utiliser au début de toute feature qui touche à un framework ou une API.
---

# Bonnes pratiques des frameworks

Objectif : coder avec la version du framework utilisée par le repo, pas avec ce que le modèle a retenu.

## 1. Identifier les versions réelles
- Symfony et Doctrine : `composer.json` (`require`), `composer.lock` pour la version exacte.
- React, TypeScript, bundler : `package.json` et lockfile (`package-lock.json`, `pnpm-lock.yaml`, `yarn.lock`).
- Docker : image de base dans les `Dockerfile` et `docker-compose*.yml`.
- GitHub Actions : `.github/workflows/*.yml` (versions des actions).
- Ne pas supposer une version : la lire dans le repo. Si absente, le dire.

## 2. Récupérer la doc à jour
- Pour chaque librairie concernée : documentation officielle par URL (`symfony.com/doc`, `react.dev`, `typescriptlang.org`, `docs.docker.com`, `docs.github.com`, etc.), via WebFetch. Une page par concept (ex. « Symfony Validator constraints », « Symfony security voters », « Messenger retry strategy »). Utiliser la version de documentation correspondant à la version du repo quand le site la propose.
- Si la page ne suffit pas : WebSearch limité au domaine officiel (ex. `site:symfony.com/doc validator constraints`).

## 3. Points à vérifier selon la stack

**Symfony / PHP**
- Autowiring et autoconfiguration des services, injection par constructeur, pas de `ContainerInterface` injecté.
- Contrôleurs fins : `#[Route]` avec méthodes HTTP explicites, `#[MapRequestPayload]` / `#[MapQueryString]` si supporté par la version.
- Validation : contraintes Validator sur les DTO, `#[IsGranted]` ou Voters pour l'autorisation.
- Sécurité : `security.yaml`, `access_control`, hashage via `PasswordHasherInterface`, CSRF sur les formulaires.
- HttpClient : timeouts explicites, `MockHttpClient` en test.
- Messenger : messages immuables, handlers idempotents, stratégie de retry.
- Config : variables via `%env()%` et `.env.local` non versionné.

**Doctrine**
- Relations chargées explicitement (`join` / fetch join) pour éviter les N+1.
- Paramètres liés (`:param`), jamais de concaténation dans DQL ou QueryBuilder.
- Migrations via `doctrine:migrations:diff` (règle du repo).
- `flush()` une fois par unité de travail, pas dans une boucle.

**React / TypeScript**
- Règles des hooks, dépendances d'`useEffect` complètes, nettoyage des effets.
- État local par défaut, remonter l'état seulement si nécessaire ; éviter le prop drilling profond sans raison.
- `key` stable (pas l'index pour des listes modifiables).
- Data fetching : utiliser le client et le cache déjà présents (TanStack Query, SWR, wrapper maison) plutôt qu'un `useEffect` + `fetch` ad hoc.
- TypeScript : `strict`, pas de `any`, types dérivés des DTO/schémas OpenAPI quand ils existent.
- Rendu : pas de `dangerouslySetInnerHTML` sans sanitization.

**Docker**
- Build multi-étapes, image de base épinglée (version, idéalement digest), utilisateur non-root, `.dockerignore`.
- Ne pas copier de secrets dans l'image ; secrets à l'exécution.

**GitHub Actions**
- `permissions:` minimales au niveau du workflow, actions tierces épinglées (SHA ou version majeure documentée).
- Secrets via `secrets.*`, jamais en clair dans les `run:`.

## 4. Restituer
- Lister les bonnes pratiques retenues pour la tâche (3 à 8 points), avec la source (URL de la page officielle).
- Signaler les écarts entre la pratique officielle et le code existant du repo : ne pas réécrire le code voisin, le signaler seulement.
- Si la doc trouvée contredit une règle du repo (`AGENTS.md`, `CLAUDE.md`), la règle du repo prime ; le dire.
