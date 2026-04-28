# TODO — QLMarkdown-CHaiMPION

Immediate work items for this fork. See `ROADMAP.md` for the longer plan.
Upstream's own todo list is preserved at `TODO.md` (untouched).

## v0.1 ship blockers

- [ ] **Test installer on a clean profile** — create a fresh macOS user,
      run `./chaimpion-bundle/install.sh`, verify spacebar render works
- [ ] **Take "before" + "after" screenshots** — same .md file, default
      QLMarkdown vs. preconfigured. Add to README.
- [ ] **Tag `v0.1`** in GitHub and attach the bundle as a release asset (zip)
- [ ] **Verify license attribution** — ensure `LICENSE.txt` is unchanged
      and `CHAIMPION-README.md` credits SBAREX prominently

## Tests to write

- [ ] **Install test:** `install.sh` runs cleanly on a profile with no
      QLMarkdown settings present
- [ ] **Backup test:** when run twice, second run preserves the original
      settings in the backup directory
- [ ] **Uninstall test:** `uninstall.sh` restores most recent backup
- [ ] **Render test:** `qlmanage -p sample/sample-with-frontmatter.md`
      produces output containing a YAML metadata table

## Documentation

- [ ] One-page setup guide (PDF or HTML) for clients who don't want to use
      the command line at all — visual walkthrough with arrows
- [ ] Short Loom / screen recording showing the install + spacebar test
- [ ] FAQ section in main README — "What if I already use QLMarkdown?"
      "Does this break the upstream app?" "How do I update?"

## Open questions

- Should the bundle ship the QLMarkdown.app binary itself (vendored), or
  always link out to upstream releases? (Vendoring = faster install but
  needs maintenance; linking = always current but two-step install.)
- Is `qlmanage -r` enough, or do we need to bounce the QuickLook agent?
- Should we add a `.dmg` build step, or keep it as a zip / git clone?
