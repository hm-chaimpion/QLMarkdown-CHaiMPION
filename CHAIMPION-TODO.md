# TODO — QLMarkdown-CHaiMPION

Immediate work items. See `ROADMAP.md` for the longer plan.
See `BUILD-BLOCKERS.md` for the v0.2 build hurdles in detail.

Upstream's own TODO is preserved at `TODO.md` (unchanged).

## v0.1 — Preconfigured bundle (shipped, awaiting test + release)

- [ ] Test installer on a clean profile / second user account
- [ ] Take "before" + "after" Quick Look screenshots, add to README
- [ ] Tag `v0.1.0` on GitHub, attach `chaimpion-bundle.zip` as release asset
- [ ] Verify `LICENSE.txt` unchanged + `CHAIMPION-README.md` credits SBAREX prominently

## v0.2 — True fork (next session)

**Resume here.** First action: read `BUILD-BLOCKERS.md`.

### Build sequence (≈3-5 hours focused work)

- [ ] **Blocker 1:** Pin Yams to 5.4.0 (or earliest version without `BUILD` Bazel file)
- [ ] Verify `Yams.compose(yaml:)` API still compiles (check `Settings+render.swift:903`)
- [ ] **Blocker 2:** Add `clean:` target to `highlight-wrapper/highlight/makefile2.makefile`
- [ ] **Blocker 3:** Add Apple ID to Xcode → Settings → Accounts → +
- [ ] First clean build via Xcode IDE: `Cmd+B` on "Markdown QL Extension" scheme
- [ ] Verify our 3 commits' edits work at runtime: 
  - YAML renders for all `.md` files (factory default)
  - URLs in YAML values are clickable
  - CHaiMPION header bar + footer appear in preview

### Branding finish (≈1 hour, after first green build)

- [ ] In Xcode UI: change bundle IDs `org.sbarex.QLMarkdown.*` → `com.chaimpion.MarkdownViewer.*`
- [ ] Display name: "CHaiMPION Markdown Viewer"
- [ ] App icon: placeholder until real design drops
- [ ] Update `Settings.swift:266` `appGroup` to `group.com.chaimpion.markdown-viewer`
- [ ] Verify settings still persist after bundle ID change

### Package + ship (≈1 hour)

- [ ] Archive in Xcode (Product → Archive)
- [ ] Export "Developer ID" or "Development" signed `.app`
- [ ] `brew install create-dmg` if not present
- [ ] Build `CHaiMPION-Markdown-Viewer-v0.2.0.dmg`
- [ ] Test install on a fresh user account: drag to /Applications, launch, spacebar test
- [ ] Tag `v0.2.0` on GitHub, attach `.dmg` as release asset

## Tests to write (eventually)

- [ ] Install test: `install.sh` runs cleanly on profile with no QLMarkdown settings
- [ ] Backup test: second `install.sh` run preserves originals in backup dir
- [ ] Uninstall test: `uninstall.sh` restores most recent backup
- [ ] Render test: `qlmanage -p sample/sample-with-frontmatter.md` produces YAML table

## Documentation backlog

- [ ] One-page setup guide (PDF/HTML) for non-technical clients
- [ ] Short Loom showing install + spacebar test
- [ ] FAQ in README: "What if I already use QLMarkdown?" / "Does this break
      the upstream app?" / "How do I update?"

## Open product questions

- Vendor `QLMarkdown.app` binary in v0.1 bundle, or always link to upstream?
  - Vendoring = faster install, no separate download for user
  - Linking = always current
- Notarisation for v0.2 `.dmg`? (Requires $99/yr Apple Developer membership)
- Auto-update via Sparkle? (Already in upstream, may need re-pointing to our appcast)
