---
name: security-hardening
description: Appliquer et vérifier les règles de sécurité sur une feature Symfony/PHP, React/TypeScript, Docker et GitHub Actions (validation, autorisation, injection, XSS, CSRF, secrets, SSRF, headers, conteneurs, CI). Utiliser pendant l'implémentation et comme passe de vérification avant de déclarer une tâche terminée.
---

# Sécurité : application et vérification

Deux usages : **appliquer** les règles en écrivant le code, puis **vérifier** le diff avec la checklist. Un point non vérifiable se signale comme tel, il n'est pas supposé OK.

## 1. Entrées
- Toute donnée venue du client, d'une URL, d'un fichier ou d'un autre service est non fiable, même si le front la valide.
- Symfony : DTO avec contraintes Validator (type, longueur, format, plage) ; valider aussi les paramètres de route et de query.
- Uploads : vérifier taille, MIME réel (pas seulement l'extension), renommer le fichier, stocker hors du webroot.
- Désérialisation : jamais `unserialize()` sur une entrée utilisateur ; types explicites.

## 2. Autorisation (IDOR inclus)
- Chaque route modifiant ou lisant une ressource privée vérifie l'accès : `#[IsGranted]`, `access_control` ou Voter.
- Ne jamais se fier à un ID fourni : charger la ressource dans le périmètre de l'utilisateur (`findOneBy(['id' => $id, 'owner' => $user])`).
- Côté React : le masquage d'un bouton n'est pas un contrôle d'accès ; le contrôle est côté serveur.
- Vérifier les actions d'administration et les endpoints « internes » exposés.

## 3. Injection
- SQL / DQL / QueryBuilder : paramètres liés uniquement. Jamais de concaténation de variable dans une requête ; `ORDER BY` et noms de colonnes via liste blanche.
- Commandes shell : éviter `exec`, `shell_exec`, `system` ; si indispensable, `Process` avec arguments séparés, jamais de chaîne construite à partir d'une entrée.
- Templates Twig : autoescape actif ; `|raw` interdit sur une donnée non maîtrisée.
- Chemins de fichiers : pas de chemin construit à partir d'une entrée sans normalisation et contrôle de préfixe (path traversal).

## 4. XSS et front
- React : pas de `dangerouslySetInnerHTML` sans sanitization (DOMPurify ou équivalent du repo) ; pas de `href`/`src` construit avec `javascript:` ou une URL non contrôlée.
- Ne pas stocker de token d'authentification dans `localStorage` si le repo utilise des cookies HttpOnly (suivre le mécanisme existant).
- Pas de données sensibles dans l'URL (query string) ni dans les logs côté client.
- `eval`, `new Function`, `innerHTML` : interdits sauf justification écrite.

## 5. CSRF, sessions, cookies
- Formulaires et actions mutantes via session : token CSRF (`csrf_token` Symfony, ou double-submit documenté pour une API).
- Cookies : `HttpOnly`, `Secure`, `SameSite=Lax` ou `Strict` quand possible.
- CORS : liste blanche d'origines explicite ; jamais `*` avec credentials ; jamais de reflet de l'en-tête `Origin`.
- Régénérer la session après login (géré par Symfony si le firewall est standard, à vérifier si personnalisé).

## 6. Secrets et configuration
- Aucun secret dans le code, les fixtures, les tests, les logs ou les messages d'erreur.
- Variables via `%env()%` ou variables d'environnement ; `.env.local` et fichiers de credentials ignorés par git.
- Ne jamais afficher la valeur d'un secret, même partiellement, dans la réponse ou le diff. Si un secret est trouvé dans le repo, le signaler sans le répéter.
- Mode debug désactivé en production (`APP_DEBUG=0`, pas de profiler exposé).
- Erreurs : message générique côté client, détail seulement dans les logs, sans données personnelles.

## 7. Données sensibles
- Mots de passe : hashage via `PasswordHasherInterface` (ou équivalent), jamais en clair ni en MD5/SHA1.
- Réponses API : sérialiser via des groupes ou DTO de sortie explicites ; ne jamais exposer une entité Doctrine brute (champs sensibles, relations).
- Journalisation : pas de mot de passe, token, numéro de carte, donnée personnelle complète dans les logs.

## 8. Appels sortants (SSRF) et HTTP inter-services
- URL construite à partir d'une entrée utilisateur : liste blanche d'hôtes, pas de suivi de redirection vers des réseaux internes.
- Timeouts explicites sur chaque appel ; gestion des erreurs transport et HTTP.
- Ne pas désactiver la vérification TLS (`verify_peer: false`) ; si un certificat interne est nécessaire, le configurer en CA.
- Réponses d'un service distant : valider avant usage (DTO), ne pas faire confiance au schéma.

## 9. Dépendances
- Ne pas ajouter une dépendance sans raison ; vérifier qu'elle est maintenue et sans CVE connue.
- Commandes d'audit à découvrir dans le repo puis lancer si elles existent : `composer audit`, `npm audit` (ou `pnpm audit`, `yarn npm audit`). Via `docker compose exec <service>` si le repo passe par Docker.

## 10. Docker
- Image de base versionnée (tag précis, idéalement digest), multi-étapes, utilisateur non-root (`USER`).
- Pas de secret en `ARG`/`ENV`/`COPY` ; `.dockerignore` excluant `.env*`, `.git`, `node_modules`, clés.
- Pas de `--privileged`, pas de montage de `docker.sock`, pas de `network_mode: host` sans justification.
- Système de fichiers en lecture seule et `cap_drop: [ALL]` quand compatible avec l'application.
- Pas de port de base de données exposé sur l'hôte en production.

## 11. GitHub Actions
- `permissions:` minimales, par défaut `contents: read`.
- Actions tierces épinglées (SHA de commit de préférence).
- `pull_request_target` : ne jamais exécuter le code de la PR avec des secrets.
- Secrets passés via `env:` et jamais interpolés directement dans `run:` avec des données de PR (injection de script).

## 12. Infrastructure Kubernetes (si concerné)
- Lecture seule sauf confirmation explicite. Vérifier : `securityContext` (non-root, `readOnlyRootFilesystem`, `allowPrivilegeEscalation: false`), secrets non en clair dans les manifests, `resources` définies.

## 13. Checklist de vérification (passe finale sur le diff)
Pour chaque point : **OK**, **KO** (fichier:ligne + correctif), ou **N/A** (raison).
- [ ] Entrées validées côté serveur
- [ ] Autorisation vérifiée sur chaque route concernée, pas d'IDOR
- [ ] Requêtes paramétrées, pas de concaténation
- [ ] Pas de `|raw`, `dangerouslySetInnerHTML`, `eval` non justifié
- [ ] Token CSRF sur les mutations par session
- [ ] Pas de secret ni de donnée sensible dans le diff, les logs ou les erreurs
- [ ] Réponses API sans champ sensible
- [ ] Timeouts et erreurs gérées sur les appels sortants
- [ ] Docker et CI : non-root, permissions minimales, pas de secret exposé
- [ ] Tests de sécurité ajoutés pour le cas refusé (accès interdit, entrée invalide)

Restituer la checklist avec les commandes d'audit lancées et leur résultat réel.
