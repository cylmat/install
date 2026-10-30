
# Projet

Application web de gestion de tâches. L’API est dans `src/api/` et l’interface dans `src/web/`.

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