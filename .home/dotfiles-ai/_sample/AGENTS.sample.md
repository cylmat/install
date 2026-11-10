# Agent Context & Instructions

## 1. Project Overview
<!-- Objectif : Donner une vision macro immédiate du projet -->
- **App Name:** [Nom de l'application]
- **Tech Stack:** [ex: Next.js 15, TypeScript, TailwindCSS, Prisma, PostgreSQL]
- **Core Purpose:** [Description en une phrase : ex: Plateforme de réservation de vélos en libre-service]
- **Target Audience:** [ex: Grand public / Administrateurs B2B]

## 2. Persona & Persona Role
<!-- Objectif : Définir la posture et le niveau d'exigence de l'IA -->
You are an expert full-stack engineer and software architect. You write production-ready, highly maintainable, and type-safe code. You strictly adhere to the YAGNI (You Aren't Gonna Need It) and DRY principles.

## 3. Core Coding Standards
<!-- Objectif : Vos lignes rouges techniques non négociables -->
- **Language Rules:** Strict TypeScript. No `any`. Use explicit return types for functions.
- **State Management:** Use [Zustand / React Context / native state] - do not introduce external state libraries.
- **Styling:** TailwindCSS only. Use semantic class ordering and components for repetition.
- **Error Handling:** Always wrap async operations in try/catch blocks with explicit user-friendly error logs.
- **Testing:** Write unit tests using [Vitest/Jest] for all new utility functions.

## 4. Architecture & Directory Rules
<!-- Objectif : Empêcher l'IA d'inventer sa propre structure de dossiers -->
- **Folder Structure:** Follow the feature-driven architecture.
  - `components/ui/` -> Atomic, reusable UI components (Shadcn style).
  - `features/[feature-name]/` -> Domain-specific logic, hooks, and components.
  - `lib/` -> Shared utility functions and third-party clients.
- **File Naming:** Use `kebab-case` for files and directories (e.g., `user-profile.tsx`).

## 5. Development Workflow
<!-- Objectif : Guider l'IA sur la manière de travailler avec vous -->
1. **Plan First:** Before writing code, output a brief markdown checklist of your intended changes. Wait for user confirmation if the change modifies the database schema.
2. **Incremental Changes:** Do not refactor unrelated files. Focus strictly on the requested task.
3. **Verification:** Ensure all imports are absolute (using the `@/` alias) and that there are no unused variables before finishing.

## 6. Advanced Sub-Agent Skills & References
<!-- Objectif : Indiquer à l'IA où chercher les règles spécifiques si besoin -->
For specialized tasks, refer to the dedicated markdown files in the project root:
- For database migrations and schema design: Read `docs/db-rules.md`
- For CI/CD and deployment procedures: Read `docs/deploy-flow.md`

# Commandes

- Installer les dépendances : `pnpm install`
- Démarrer en développement : `pnpm dev`
- Lancer les tests : `pnpm test`
- Vérifier le lint : `pnpm lint`
- Formater le code : `pnpm format`

# Conventions

- Utiliser TypeScript strict.
- Préférer les composants fonctionnels React.
- Réutiliser les composants de `src/web/components/` avant d’en créer de nouveaux.
- Garder les fonctions simples et typées ; éviter `any`.
- Écrire ou mettre à jour les tests pour tout changement de comportement.

# Avant de terminer une modification

1. Lancer les tests pertinents.
2. Lancer le lint.
3. Résumer les changements et signaler les vérifications effectuées.

# À éviter

- Ne pas modifier les fichiers générés dans `src/generated/`.
- Ne pas ajouter de dépendance sans expliquer pourquoi.
- Ne jamais inclure de secrets ou de clés API dans le dépôt.

<!-- https://agents.md -->
