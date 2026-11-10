---
description: Revue en lecture seule du diff courant (Doctrine, HTTP, sécurité, tests)
---

Fais une revue de code en lecture seule du diff de la branche courante.

1. Trouve la branche de base (ne la suppose pas) puis `git diff <base>...HEAD`.
2. Lis le contexte autour des lignes modifiées.
3. Contrôle : N+1 Doctrine, validation des entrées, timeouts et erreurs des appels HTTP inter-services, DTO typés, injection, XSS, secrets, contrôle d'accès, tests manquants.
4. Réponds par sévérité : bloquant, à corriger, suggestion. Chaque point avec fichier:ligne et correctif en une phrase.
5. Ne modifie aucun fichier.
