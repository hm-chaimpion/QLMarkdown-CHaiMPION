---
title: Sample COS Markdown File
thread_id: SAMPLE-T0001-0000
session_id: 00000000-0000-0000-0000-000000000000
surface: claude-code-cli
model: claude-opus-4-7
author: Hamish McGregor
co_author: claude-opus-4-7
created: 2026-04-29
status: sample
type: example
turns: 0
---

# Sample COS Markdown File

This file demonstrates how the QLMarkdown-CHaiMPION preconfigured Quick Look
extension renders YAML frontmatter as a clean two-column metadata table at the
top of the preview, separate from the body content.

## How to test

1. Make sure QLMarkdown.app is installed in `/Applications/`
2. Run `./install.sh` from the bundle root
3. Select this file in Finder and press the spacebar

You should see:

- A two-column table at the top (the YAML frontmatter)
- This H1 below it
- The body text rendered as you'd expect

## What's rendering

| Element | Behaviour |
|---|---|
| YAML frontmatter | Two-column metadata table |
| Headings | H1 / H2 / H3 with hierarchy |
| Tables | GitHub-style |
| Code blocks | Syntax-highlighted |
| Links | Clickable (where supported) |

## Roadmap (not in v0.1)

- Clickable URLs inside YAML values
- Dark mode support
- Type icons per field (Obsidian Properties style)
- Collapsible header / footer zones
- Folder-level browsing

## Credit

Built on [`sbarex/QLMarkdown`](https://github.com/sbarex/QLMarkdown) (MIT).
CHaiMPION bundle preserves attribution and license.
