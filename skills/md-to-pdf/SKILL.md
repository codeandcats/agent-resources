---
name: md-to-pdf
description: Convert a markdown file to a PDF. Supports syntax-highlighted code blocks and rendered Mermaid diagrams. Use this skill whenever the user asks to convert, export, or save a markdown file as a PDF.
---

Convert a markdown file to PDF with syntax-highlighted code blocks and rendered Mermaid diagrams.

When constructing commands, use the absolute path to the directory containing this file as `<skill-dir>`.

## Checking the tool is installed

Run:

```
<skill-dir>/node_modules/.bin/md-to-pdf --version
```

If the command is not found, run setup (see below) before proceeding.

## Setup

```
bash <skill-dir>/setup.sh
```

If setup aborts due to vulnerabilities, inform the user and ask whether they want to re-run with `--skip-audit` to install anyway.

If setup fails because Node.js is not installed:
1. Check which version managers are available: `command -v mise`, `command -v nvm`, `command -v fnm`, `command -v volta`, `command -v brew`
2. If multiple are found, ask the user which they'd like to use to install Node.js
3. If only one is found, suggest it directly
4. If none are found, suggest: `brew install node`
5. Once Node.js is installed, re-run `setup.sh`

## Converting a file

```
<skill-dir>/node_modules/.bin/md-to-pdf --config-file <skill-dir>/config.json <input.md>
```

The PDF is saved alongside the input file with a `.pdf` extension.

## Options

- Letter paper: `--pdf-options '{"format":"Letter"}'`
- Landscape orientation: `--pdf-options '{"landscape":true}'`
- Custom stylesheet: `--stylesheet /path/to/custom.css`

## Mermaid diagrams

Mermaid code blocks (triple-backtick blocks tagged `mermaid`) are automatically rendered as diagrams — no extra steps needed.

If diagrams appear as raw text, mermaid failed to load from the CDN. Check the user has internet access and re-run. If the problem persists, check that `https://cdn.jsdelivr.net` is reachable.

## Errors

- Binary not found or `node_modules/` missing — run setup
- Any npm error during setup — ensure Node.js and npm are installed and the skill directory is writable
