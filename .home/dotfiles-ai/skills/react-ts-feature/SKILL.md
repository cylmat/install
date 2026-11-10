---
name: react-ts-feature
description: Implémenter une fonctionnalité React/TypeScript en lisant d'abord les conventions existantes du repo (state, data fetching, tests, structure) puis en s'y conformant. Utiliser pour toute feature front.
---

# Feature React + TypeScript

## 1. Lire les conventions du repo
- `package.json` : version de React, gestionnaire de paquets (lockfile présent), scripts `lint`, `test`, `typecheck`, `build`.
- Structure : `src/` et découpage (features, pages, components), alias de chemins (`tsconfig.json`).
- State : repérer Redux, Zustand, Context, React Query/TanStack Query, SWR (`grep -rl` sur les imports).
- Data fetching : repérer le client HTTP existant (fetch wrapper, axios, client généré depuis OpenAPI). Le suivre.
- Tests : Jest, Vitest, React Testing Library, Playwright. Repérer un test existant similaire et le prendre comme modèle.
- Styles : CSS modules, Tailwind, styled-components, design system interne.

## 2. Plan court avant de coder
- Lister les fichiers à créer ou modifier.
- Signaler toute divergence entre la demande et les conventions trouvées.

## 3. Implémenter
- Composants fonctionnels, props typées, pas de `any`. Éviter `as` sauf justification.
- Réutiliser les composants et hooks existants avant d'en créer.
- Gérer les états chargement, erreur et vide.
- Diff minimal : pas de refactoring des composants voisins.

## 4. Tests
- Ajouter ou adapter les tests selon le framework trouvé, sur le comportement visible (RTL : rôles, texte) plutôt que sur les détails d'implémentation.

## 5. Définition de terminé
- Lint, typecheck (`tsc`, sans erreur), tests ciblés verts, en utilisant les scripts du repo.
- Si le repo passe par Docker, utiliser le service déclaré dans `docker-compose*.yml`.
- Rapporter les commandes exactes et leur résultat.
