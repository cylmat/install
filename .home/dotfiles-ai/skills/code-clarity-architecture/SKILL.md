---
name: code-clarity-architecture
description: Garder le code clair, maintenable et bien organisé (découpage en couches Symfony, structure par feature React, nommage, taille des fonctions et composants, dépendances). Utiliser pour décider où placer du code nouveau et comment le structurer, avant et pendant l'implémentation.
---

# Clarté du code et architecture

Règle de base : le code doit se lire sans commentaire pour le « quoi ». Les commentaires expliquent le « pourquoi ».

## 1. Respecter l'architecture existante
- Avant de créer un dossier ou une couche, repérer la structure actuelle (`src/`, `assets/`, `frontend/`, `features/`, etc.) et la suivre.
- Chercher un module comparable et l'imiter (même découpage, même nommage, même emplacement).
- Si l'existant est incohérent, suivre la convention majoritaire et le signaler ; ne pas réorganiser au passage.

## 2. Backend Symfony : répartition des responsabilités
- **Contrôleur** : reçoit la requête, valide l'entrée (DTO), appelle un service, renvoie la réponse. Pas de logique métier ni de requête Doctrine directe si le repo a une couche service.
- **Service applicatif / Manager** : orchestre un cas d'usage. Une classe, une responsabilité, un verbe dans le nom (`CreateInvoice`, `CancelSubscription`).
- **Domaine / Entités** : règles métier proches des données (invariants dans l'entité quand c'est naturel).
- **Repository** : requêtes uniquement, retourne des entités ou des DTO, pas de logique métier.
- **Client HTTP inter-services** : une classe par service distant, DTO explicites en entrée et sortie (règle du repo).
- Injection par constructeur ; dépendances peu nombreuses. Si une classe dépasse 5 à 6 dépendances, c'est un signal de découpage.

## 3. Frontend React : structure par feature
- Regrouper par fonctionnalité quand le repo le fait (`features/invoices/` avec composants, hooks, api, types, tests), plutôt que par type de fichier global.
- Séparer :
  - **composants de présentation** : props en entrée, pas d'appel réseau ;
  - **hooks** : logique d'état et de données ;
  - **appels API** : fonctions dédiées, typées, hors des composants.
- Extraire un hook quand la logique dépasse quelques lignes ou est réutilisée. Ne pas extraire un hook pour une ligne.
- Un composant qui dépasse ~150 lignes ou gère plusieurs responsabilités : le découper.
- Props typées explicitement, pas de booléens qui pilotent plusieurs modes (préférer des composants séparés ou une prop union).

## 4. Nommage
- Noms explicites et prononçables. Pas d'abréviation sauf les usuelles (`id`, `url`, `dto`).
- Booléens : `isX`, `hasX`, `canX`.
- Fonctions : verbe + objet. Collections au pluriel.
- Un même concept, un même nom dans tout le code (pas `user`, `account`, `member` pour la même chose).
- Éviter les noms génériques : `Helper`, `Utils`, `Manager` fourre-tout, `data`, `info`.

## 5. Fonctions et flux
- Retours anticipés (early return) plutôt que des `if` imbriqués.
- Une fonction = un niveau d'abstraction. Viser moins de 30 lignes ; au-delà, extraire.
- Pas de paramètres booléens dans les signatures publiques quand ils changent le comportement.
- Pas de code mort, pas de `TODO` sans ticket, pas de code commenté.
- Gestion d'erreurs : exceptions métier explicites, pas d'exception avalée (`catch` vide interdit).

## 6. Dépendances et abstraction
- Ne pas ajouter une abstraction (interface, factory, générique) sans deuxième usage réel ou besoin de test évident.
- Ne pas ajouter une dépendance npm/composer si la stack la fournit déjà.
- Réutiliser les composants, hooks, helpers et services existants avant d'en créer.

## 7. Diff minimal
- Ne pas renommer, reformater ni refactorer le code voisin non concerné par la demande.
- Si un refactoring est indispensable pour la feature, le faire dans un changement séparé et le dire.

## 8. Tests comme documentation
- Un test nomme le comportement attendu (`it('affiche un message quand la liste est vide')`, `test_cancel_fails_when_already_paid`).
- Tester le comportement public, pas les détails internes.

## 9. Contrôle final
- Chaque nouveau fichier est à l'endroit où un développeur du repo le chercherait.
- Chaque nouveau nom est cohérent avec les noms voisins.
- Aucune fonction ou composant n'a plus d'une responsabilité claire.
- Les commentaires restants expliquent un choix, pas une évidence.
