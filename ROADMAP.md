# Roadmap — QLMarkdown-CHaiMPION

Versioned plan for the CHaiMPION fork of `sbarex/QLMarkdown`. Driven by the
COS client-share use case: non-technical professionals previewing markdown
files in Finder without installing Obsidian or other heavy editors.

## v0.1 — Preconfigured bundle (shipped 2026-04-29)

Config-only, no upstream code changes. Branch: `chaimpion/v0.1-preconfig`.

- [x] Fork repository to `hm-chaimpion/QLMarkdown-CHaiMPION`
- [x] Locate settings storage (`~/Library/Preferences/org.sbarex.QLMarkdownXPCHelper.plist`)
- [x] Export current "good" plist (YAML for all .md, autolink, syntax, table, math, footnote)
- [x] Build `install.sh` with backup + qlmanage refresh
- [x] Write `uninstall.sh` for restore
- [x] Bundle sample COS-style file with frontmatter
- [x] Write installer README for non-technical users
- [x] Push to GitHub
- [ ] Test bundle on a fresh user profile / clean machine
- [ ] Tag `v0.1` GitHub release with bundle as attachment

## v0.2 — True fork: branded .app + clickable URLs (in progress, blocked)

Branch: `chaimpion/v0.2-fork`. **Source edits committed; build blocked.**
See `BUILD-BLOCKERS.md` for the four blockers and resolution paths.

### Code changes done (committed)
- [x] `yamlExtension` factory default → `.allFiles` (works out of the box)
- [x] SBAREX about/footer text replaced with CHaiMPION + upstream attribution
- [x] About-box developer credit shows CHaiMPION + sbarex (MIT)
- [x] Buy-me-a-coffee URL still forwards to sbarex (preserves upstream support pathway)
- [x] Copyright strings updated in QLMarkdown/Info.plist + QLExtension/Info.plist
- [x] `linkifyYamlValue()` helper — clickable URLs in YAML frontmatter values
- [x] Baked-in CHaiMPION header bar + footer in `getCompleteHTML` rendering pipeline

### Build still needed
- [ ] **Pin Yams to 5.4.0** to resolve Bazel-file vs. Xcode 16 collision
- [ ] **Patch highlight `makefile2.makefile`** to add `clean:` target
- [ ] **Add Apple ID to Xcode** (Settings → Accounts) for code signing
- [ ] First green build via Xcode IDE
- [ ] Test rendering on actual `.md` file with frontmatter
- [ ] Bundle ID rename: `org.sbarex.QLMarkdown` → `com.chaimpion.MarkdownViewer` (via Xcode UI, after first build)
- [ ] App display name: "QLMarkdown" → "CHaiMPION Markdown Viewer"
- [ ] App icon (placeholder for now; real CHaiMPION icon design later)
- [ ] Archive → export → `.dmg` package
- [ ] Test on a separate user account
- [ ] Tag `v0.2.0` GitHub release

## v0.3 — Polish

Depends on v0.2 shipping.

- [ ] Type icons per field (≡ for text, calendar for dates, link for URLs)
- [ ] Date formatting (`260429` → "29 Apr 2026")
- [ ] Pill rendering for known COS keys (`thread_id`, `surface`, `model`)
- [ ] Dark mode polish (currently auto via `prefers-color-scheme`)
- [ ] Custom CSS hooks for client-specific theming

## v0.4 — Three-zone collapsible structure

Header / Body / Footer pattern for long COS files.

- [ ] Detect YAML frontmatter → collapsible header zone
- [ ] Heuristic: detect H2 sections like "Thread Outcomes", "Key Derivatives",
      "Learnings Flagged" as footer markers → collapsible footer zone
- [ ] Body always visible; header/footer collapsed by default
- [ ] User-configurable list of footer-marker H2 strings

## v1.0 — Folder browser ("CHaiMPION Folder Viewer")

The big rescope. Out of QLMarkdown's architecture — likely a separate
project: `projects/0.5N_chaimpion-folder-viewer/`.

- [ ] Standalone Mac app (or Finder Sync extension) for folder browsing
- [ ] Right-click folder in Finder → "Browse markdown files"
- [ ] Tree view + preview pane
- [ ] Cross-file links (wiki-style `[[link]]` resolution)
- [ ] Designed for non-technical professionals — UX-first, not feature-first
- [ ] Bundled with v0.4 Quick Look extension for spacebar previews

## OS / Xcode upgrade thinking

| Path | Pro | Con | Recommendation |
|---|---|---|---|
| Stay on macOS 15.3.1 + Xcode 16.4 (current) | No upgrade overhead | Yams Bazel collision is real | Just fix v0.2 blockers directly |
| Update macOS 15.x → 15.7.x (point release) | Security patches | No effect on build blockers | Do at next maintenance window |
| Update macOS 15.x → 26.x (next major, hypothetical) | Newest features | Unknown impact on Xcode + projects | Wait until v0.2 ships; risky during build work |
| Update Xcode 16.4 → 17 when released | May resolve Yams collision | May break other things | Wait until released + tested by community |
| Downgrade Xcode 16.4 → 15.4 | Avoids new build system issues | Loses macOS 15.5 SDK; another download | Only if v0.2 blockers prove stubborn |

**Decision for resumption:** stay on current OS + Xcode. Fix the four
blockers directly. Don't conflate platform upgrades with build debugging.

## Non-goals

- Markdown editing (this is a viewer, not an editor)
- Plugin system (overscoping)
- Cross-platform (macOS only by design)
- Replacing Obsidian for power users (different audience)
