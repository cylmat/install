---
name: k8s-manifest-review
description: Relire des manifests Kubernetes (Deployment, StatefulSet, Service, Ingress, Helm/Kustomize rendus) selon une checklist : resources, probes, secrets, securityContext. Inspection en lecture seule. Utiliser pour toute revue de manifest.
---

# Revue de manifests Kubernetes

## Règle de sécurité
- Lecture seule. Aucun `kubectl apply`, `delete`, `edit`, `patch`, `exec` ou `scale` sans demande explicite et confirmation.
- Vérifier le contexte avant toute lecture en cluster : `kubectl config current-context`. Si le nom contient `prod`, ne rien faire sur le cluster sans confirmation explicite.

## 1. Trouver les manifests
- Chercher dans le repo : `grep -rl "kind: Deployment\|kind: StatefulSet" --include="*.yaml" --include="*.yml" .`
- Helm : `Chart.yaml` et `templates/`. Rendre avec `helm template` si disponible, sans `install`.
- Kustomize : `kustomization.yaml`. Rendre avec `kubectl kustomize <dossier>` (lecture seule).

## 2. Checklist
- **Resources** : `requests` et `limits` CPU et mémoire définis sur chaque conteneur.
- **Probes** : `readinessProbe` et `livenessProbe` présentes, chemins et ports réels, `livenessProbe` pas trop agressive.
- **Secrets** : aucun secret en clair dans `env.value`, ni dans un ConfigMap. Utiliser `secretKeyRef` ou un outil externe. Signaler toute valeur qui ressemble à un secret.
- **securityContext** : `runAsNonRoot: true`, `allowPrivilegeEscalation: false`, `readOnlyRootFilesystem` si possible, `capabilities.drop: [ALL]`.
- **Image** : tag fixe (pas `latest`), pull policy cohérente.
- **Réplicas et disponibilité** : `replicas` > 1 pour les services critiques, `PodDisruptionBudget` si pertinent.
- **Labels et sélecteurs** : le `selector` du Service correspond aux labels des pods.
- **Ingress** : TLS déclaré, host explicite.

## 3. Rapport
- Lister les constats par sévérité (bloquant, à corriger, suggestion), avec le fichier et la ligne.
- Ne proposer une correction que si elle est demandée. Sinon, rester en revue.
