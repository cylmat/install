---
name: explain-feature
description: Expliquer une fonctionnalité d'un code base en suivant ses dépendances de bout en bout (controller → manager/service → helpers → repository, clients HTTP, événements, config), en lecture seule, et livrer une synthèse courte de ce qu'elle fait. Utiliser quand on demande "explique-moi cette feature", "comment marche X", "trace le flux depuis le controller".
allowed-tools: Read, Grep, Glob, Bash(git log:*), Bash(git show:*), Bash(git blame:*)
disallowed-tools: Edit, Write, NotebookEdit, Bash(git commit:*), Bash(git push:*), Bash(git checkout:*), Bash(git stash:*), Bash(git reset:*)
---

# Comprendre une feature

Objectif : produire une vue claire et synthétique d'une fonctionnalité en suivant le chemin réel du code, sans rien modifier.

## Règles

- **Lecture seule.** Aucune écriture, aucun `git` qui modifie l'état (pas de checkout, stash, commit, push), aucune commande qui lance des migrations, des tests avec effets de bord ou des requêtes réseau. Autorisés : `Read`, `Grep`, `Glob`, `git log`/`git show`/`git blame` en lecture.
- **Ne pas supposer.** Chaque maillon de la chaîne est vérifié en ouvrant le fichier. Si un type ou un service ne se résout pas, le dire.
- **Ne jamais afficher de secrets** (`.env`, kubeconfig, tokens) même s'ils apparaissent dans la chaîne.
- **Synthèse courte.** Le but est de comprendre, pas de recopier le code.

## 1. Cadrer le point d'entrée

- Identifier la demande : nom de feature, route, nom de controller, commande, événement.
- Trouver le point d'entrée :
  - route : `Grep` sur les attributs `#[Route(`, `@Route`, `routes.yaml`, `->get(`/`->post(`, `router.ts`, etc. selon le framework ;
  - nom : `Grep -ri "<mot-clé>"` puis `Glob` sur les noms de fichiers.
- Si plusieurs candidats plausibles existent, en retenir le plus probable et le noter dans la réponse ; ne demander une précision que si le choix change vraiment le résultat.
- Repérer le framework et la structure (Symfony, Laravel, Express, Nest, Django, Spring, Next.js…) via `composer.json`, `package.json`, `pyproject.toml`, `pom.xml`, etc. Ne pas deviner la convention de dossiers : la lire.

## 2. Suivre les dépendances

Parcourir le graphe depuis le point d'entrée, en profondeur, pour chaque fichier lu :

1. **Entrée** : controller, handler, route, listener, job, commande CLI. Noter les paramètres, la validation (DTO, form, schema), les droits (voters, middlewares, `IsGranted`).
2. **Orchestration** : manager, service applicatif, use case, handler de commande. Noter l'enchaînement des étapes et les branches conditionnelles importantes.
3. **Métier** : services de domaine, calculs, règles, machines à états.
4. **Helpers / utilitaires** : seulement ceux qui portent de la logique (ignorer les helpers triviaux).
5. **Persistance** : repositories, requêtes (QueryBuilder, DQL, ORM, SQL brut), entités concernées, index ou contraintes notables.
6. **Intégrations externes** : clients HTTP inter-services (DTO, timeouts, gestion d'erreurs), files de messages, mails, stockage, cache.
7. **Transverse** : événements émis/écoutés, configuration (`services.yaml`, `config/`, variables d'environnement lues), feature flags, tâches planifiées (cron, scheduler).

Règles de parcours :

- Suivre les **imports et injections de dépendances** (constructeur, `inject`, `@Inject`, `Depends`) : c'est le moyen le plus fiable de trouver le service suivant. Vérifier la définition réelle de chaque service (le binding peut être dans la config).
- Pour un interface, trouver l'implémentation effectivement câblée (config, `#[AsAlias]`, `providers`).
- Utiliser `Grep` ciblé plutôt que de lire des dossiers entiers. Lire par plages (`offset`/`limit`) pour les gros fichiers.
- Pour les tâches longues ou un large balayage, déléguer à l'agent `explorer` ou `Explore` et ne garder que ses conclusions.
- **Arrêter** quand on atteint : la persistance, un appel externe, ou un code hors du périmètre de la feature (librairie, framework). Ne pas remonter tout le repo.
- Garder une trace des fichiers visités (`chemin:ligne`) pour les citer.

## 3. Repérer ce qui compte

Pendant le parcours, relever :

- les **règles métier** effectives (conditions, seuils, états, calculs) ;
- les **effets de bord** : écritures en base, mails, appels HTTP, événements, fichiers ;
- les **cas d'erreur** et leur traitement (exceptions, codes HTTP, retries, rollback/transaction) ;
- les **risques visibles** en lecture seule : requêtes dans une boucle (N+1), appel HTTP sans timeout, donnée utilisateur non validée, transaction absente sur plusieurs écritures. Les signaler comme observations, pas comme bugs avérés, sauf preuve dans le code.
- les **trous** : code mort, TODO, branche jamais atteinte, dépendance introuvable.

## 4. Restituer

Réponse en français, synthétique, dans cet ordre :

```
## <Nom de la feature>

**En une phrase :** ce que fait la fonctionnalité, du point de vue utilisateur ou système.

**Déclencheur :** route/commande/événement → `chemin/Controller.php:NN` (méthode)

**Flux :**
1. Entrée — `fichier:ligne` : validation, droits
2. Orchestration — `fichier:ligne` : étapes principales
3. Métier — `fichier:ligne` : règles clés
4. Persistance — `fichier:ligne` : entités, requêtes
5. Effets externes — mails, HTTP, événements (si présents)

**Règles métier notables :** liste courte.

**Erreurs et cas limites :** comment ils sont gérés.

**Points d'attention :** observations (N+1, timeout absent, etc.) avec `fichier:ligne`.

**Non vérifié :** ce qui n'a pas pu être suivi (service introuvable, code dynamique) et pourquoi.
```

Adapter : omettre une section vide plutôt que de la remplir. Un schéma ASCII du flux n'est utile que si le flux a plus de trois branches.

Ne pas recopier le code. Ne pas résumer ce que le diff ferait : il n'y a pas de diff en lecture seule. Si l'utilisateur veut aller plus loin (tests, modification), le dire et s'arrêter là : ce skill ne modifie rien.
