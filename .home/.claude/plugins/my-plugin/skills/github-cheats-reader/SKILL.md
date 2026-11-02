---
name: github-cheats-reader
description: "Get github cheatsheet from repository 'cheats' accessible to the authenticated PAT token, in read-only mode. Use when asked to list, retrieve and get specific context cheatsheets."
user-invocable: true
---

# GitHub Cheatsheet Access

Get cheatsheets from the 'cheats' repository accessible to the GitHub identity authenticated by the available GitHub tools. This workflow is strictly read-only.


## Safety

- Use only read operations. Do not create, edit, delete, fork, merge, or otherwise mutate repositories, issues, pull requests, or settings.
- Never request, print, or store the PAT. Authentication is managed by the configured GitHub integration.
- Do not infer repository permissions or private visibility from search results unless the tool explicitly returns that information.
