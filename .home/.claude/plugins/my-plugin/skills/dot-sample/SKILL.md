---
name: dot-sample
description: Verify that every non-blank line of the PHP files ends with a semicolon (";"). Use when the user says "dot", asks to check PHP semicolons, or wants PHP files validated for line endings with ";".
---

# dot

Checks that every non-blank line in every `*.php` file ends with `;`.

## How to run

Run the bundled checker from the working directory (or pass specific paths):

```bash
bash ~/.claude/skills/dot/check.sh            # all *.php under the current directory
bash ~/.claude/skills/dot/check.sh src lib    # only the given paths
```

Behaviour:
- Trailing whitespace and CRLF line endings are ignored before the check.
- Blank lines are ignored.
- `vendor/`, `node_modules/`, `.git/` and `.trees/` are skipped.
- Exit code `0` = all files pass, `1` = at least one violation.

## Reporting

- If the script exits `0`, report the file count and that all lines pass.
- If it exits `1`, list each failing file with its offending `line N: <content>` entries, then state how many files failed. Do not edit the files unless the user asks for fixes.
