---
name: context-doc
description: This skill should be used when the user asks about libraries, frameworks, API references, or needs code examples. Activates for setup questions, code generation involving libraries, or mentions of specific frameworks like React, Vue, Next.js, Symfony, Doctrine, etc.
---

When the user asks about libraries, frameworks, or needs code examples, read the official framework documentation at its web URL instead of relying on training data.

## When to Use This Skill

Activate this skill when the user:

- Asks setup or configuration questions ("How do I configure a Next.js proxy?")
- Requests code involving libraries ("Write a Doctrine query for...")
- Needs API references ("What are the Symfony security attributes?")
- Needs an exact fact from a library's documentation: a default value, a signature, or an option name
- Mentions specific frameworks (React, Vue, Svelte, Express, Tailwind, etc.)

## How to Find the Documentation

### Step 1: Identify the Official Doc URL

Use the known official entry points below. Pick the page that matches the concept.

| Library | Official documentation |
|---|---|
| Symfony | https://symfony.com/doc/current/index.html |
| Doctrine ORM | https://www.doctrine-project.org/projects/doctrine-orm/en/latest/ |
| Doctrine Migrations | https://www.doctrine-project.org/projects/doctrine-migrations/en/latest/ |
| PHP | https://www.php.net/manual/en/ |
| React | https://react.dev/reference/react |
| TypeScript | https://www.typescriptlang.org/docs/ |
| Next.js | https://nextjs.org/docs |
| Vite | https://vite.dev/guide/ |
| Tailwind CSS | https://tailwindcss.com/docs |
| Docker | https://docs.docker.com/ |
| GitHub Actions | https://docs.github.com/en/actions |

If the library is not in the table, use WebSearch to find its official documentation site, and prefer the project's own domain over blogs or forks.

### Step 2: Use a Version-Specific URL When Needed

- If the user mentions a version (e.g., "React 19", "Symfony 7.2"), use the versioned page when the site provides one (e.g., `https://symfony.com/doc/7.2/...`).
- If the project's version is known from its lockfile or `composer.json` / `package.json`, prefer that version's documentation.

### Step 3: Fetch the Page

- Use WebFetch on the most specific page for the question (one concept per fetch).
- If the page is not enough, follow links on the official site, or use WebSearch restricted to the official domain (e.g., `site:symfony.com/doc validator constraints`).
- For a question about the exact internal behavior of a library, read the source on its official repository only when the docs do not answer it.
- If a page cannot be fetched, say so and use another official page; do not invent content from memory.

### Step 4: Cite Sources

- Give the URL of each page used.
- Cite the library version when relevant.

### Step 5: Use the Documentation

- Answer the user's question using the fetched content.
- Include relevant code examples from the docs.
- If the docs contradict the project's existing code or conventions, say so and let the project's rules take precedence.

## Guidelines

- **Be specific**: fetch the page for one concept at a time. For a multi-topic question (e.g. routing and auth and caching), fetch a separate page per concept unless the question is about how they interact.
- **Version awareness**: use the version-specific documentation when a version is known.
- **Official sources only**: prefer the project's own documentation over third-party tutorials. Mark any community source as such.
