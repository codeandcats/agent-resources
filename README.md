# @codeandcats/agent-resources

A collection of AI skills.

## Prerequisites

- [Node.js](https://nodejs.org) (required by some skills for setup)

## Skills

### Markdown to PDF

Converts markdown files to PDF with syntax-highlighted code blocks and rendered Mermaid diagrams.

Installs `md-to-pdf` locally at a pinned version so the agent can permanently approve a single, known binary — rather than requiring broad permissions like `node <script>` that would allow arbitrary code execution.

```bash
npx skills add codeandcats/md-to-pdf
```
