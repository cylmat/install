---
name: swagger-http-client
description: Générer un client HTTP Symfony typé (DTO, HttpClient, erreurs, timeouts, tests MockHttpClient) à partir d'une spec OpenAPI/Swagger, par URL ou fichier. Utiliser quand on doit appeler un autre microservice.
---

# Client HTTP inter-services depuis OpenAPI

## 1. Récupérer la spec
- Si on a une URL, la télécharger avec `curl -fsSL <url> -o <dossier-temporaire>/openapi.json` (ou `.yaml`). Ne pas la committer.
- Si on a un fichier local, le lire en place.
- Valider que c'est bien OpenAPI 3.x ou Swagger 2.0 (`openapi:` ou `swagger:` en tête).
- Si la spec est absente ou inaccessible, s'arrêter et demander. Ne pas inventer les schémas.

## 2. Découvrir le contexte du repo (ne rien supposer)
- Version PHP et Symfony : `composer.json`.
- Présence de `symfony/http-client` et `symfony/serializer` ou `symfony/validator`.
- Namespace et dossiers existants : chercher un `HttpClient` ou des clients déjà présents (`grep -rl "HttpClientInterface" src/`). Les **suivre**.
- Configuration des clients : `config/packages/framework.yaml` (clé `http_client`), variables d'env des URLs de services. Les URLs passent par `%env(...)%`, jamais en dur.
- Tests : repérer PHPUnit (`phpunit.xml*`) et l'usage de `MockHttpClient` existant.

## 3. Générer
- **DTO** : une classe par schéma utile, propriétés typées, `readonly` si la version PHP le permet. Pas de `array` en entrée ou sortie.
- **Client** : une classe par service distant, dans le namespace trouvé à l'étape 2. Injection de `HttpClientInterface` uniquement.
- **Timeouts** : `timeout` et `max_duration` explicites sur chaque requête, valeur en constante ou paramètre.
- **Erreurs** : distinguer transport (`TransportExceptionInterface`), HTTP 4xx/5xx (`ClientExceptionInterface`, `ServerExceptionInterface`) et désérialisation. Exception métier dédiée au service, sans fuiter le corps de réponse brut dans les logs.
- **Désérialisation** : mapper vers les DTO, valider si le repo utilise le validator.

## 4. Tests
- `MockHttpClient` avec des réponses fixtures issues de la spec (JSON d'exemple).
- Couvrir : succès, 4xx, 5xx, timeout simulé, JSON invalide.
- Aucun appel réseau réel.

## 5. Vérifier
- Lancer les commandes découvertes dans le repo (lint, analyse statique, tests ciblés), via `docker compose exec` si le repo l'utilise.
- Rapporter les commandes exactes et leur résultat.

## Ne pas faire
- Pas de `stdClass`, pas de tableaux anonymes entre client et appelant.
- Pas de régénération massive de fichiers existants : diff minimal.
