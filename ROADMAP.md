# Roadmap — QLMarkdown-CHaiMPION

Versioned plan for the CHaiMPION fork of `sbarex/QLMarkdown`. Driven by COS
client-share use cases: non-technical professionals previewing markdown files
in Finder without installing Obsidian or other heavy editors.

## v0.1 — Preconfigured bundle (shipped 2026-04-29)

Config-only, no upstream code changes.

- [x] Fork repository to `hm-chaimpion/QLMarkdown-CHaiMPION`
- [x] Locate settings storage (`~/Library/Preferences/org.sbarex.QLMarkdownXPCHelper.plist`)
- [x] Export current "good" plist (YAML for all .md, autolink, syntax, table, math, footnote)
- [x] Build `install.sh` with backup + qlmanage refresh
- [x] Write `uninstall.sh` for restore
- [x] Bundle sample COS-style file with frontmatter
- [x] Write installer README for non-technical users
- [ ] Test bundle on a fresh user profile / clean machine
- [ ] Tag and release `v0.1` on GitHub

## v0.2 — Polish: clickable URLs + dark mode

Requires Xcode and Swift work. Depends on a working build of the upstream app.

- [ ] Install full Xcode (currently only CLI tools present locally)
- [ ] Build upstream baseline app from source — verify it runs unmodified
- [ ] Locate YAML rendering code in `cmark-extra/` or Swift wrapper
- [ ] Patch YAML value rendering: detect URLs, wrap in `<a>` tags
- [ ] Add dark mode CSS — auto-switch via `prefers-color-scheme`
- [ ] Side-by-side screenshot test: light + dark, before + after

## v0.3 — Obsidian Properties parity

The visual design target. See screenshot in
`_activity/260429-markdown-viewer-audit/` for reference.

- [ ] Type icons per field (≡ for text, 0/1 for numbers, calendar for dates, link for URLs)
- [ ] Two-column layout with consistent gutter
- [ ] Special pill rendering for known COS keys (`thread_id`, `surface`, `model`)
- [ ] Date formatting (`260429` → "29 Apr 2026")
- [ ] Field-name normalization (snake_case → "Snake Case" labels — optional toggle)

## v0.4 — Three-zone collapsible structure

Header / Body / Footer pattern for long COS files.

- [ ] Detect YAML frontmatter → render as collapsible header zone
- [ ] Heuristic: detect H2 sections like "Thread Outcomes", "Key Derivatives",
      "Learnings Flagged" as footer markers → collapse into footer zone
- [ ] Body is always visible; header/footer collapsed by default
- [ ] User-configurable list of footer-marker H2 strings

## v1.0 — Folder browser ("COS Browser")

The big rescope. Out of QLMarkdown's architecture — likely a separate
project: `projects/0.5N_cos-browser/`.

- [ ] Standalone Mac app (or Finder Sync extension) for folder browsing
- [ ] Right-click folder in Finder → "Browse markdown files"
- [ ] Tree view + preview pane
- [ ] Cross-file links (wiki-style `[[link]]` resolution)
- [ ] Designed for non-technical professionals — UX-first, not feature-first
- [ ] Bundled with v0.4 Quick Look extension for spacebar previews

## Non-goals (explicitly out of scope)

- Markdown editing (this is a viewer, not an editor)
- Plugin / extension system (overscoping for the v0–v1 timeline)
- Cross-platform support (macOS only, by design)
- Replacing Obsidian for power users (different audience)

## How decisions get made

- v0.1 → v0.4: incremental, each ships when it's better than the last
- v1.0: separate project brief required before starting
- Upstream contributions: file issue/PR back to `sbarex/QLMarkdown` whenever
  the change is general-interest (not COS-specific). Keep the fork lean.
