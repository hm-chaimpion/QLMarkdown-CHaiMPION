# BUILD-BLOCKERS — v0.2 fork

Status as of 2026-04-29: **v0.2 source edits committed, build incomplete.**

If you're resuming v0.2 work, start here.

## What's done

All Swift source edits are committed and pushed on `chaimpion/v0.2-fork`:

1. `v0.2: rebrand SBAREX → CHaiMPION, factory defaults for COS` — 6 files
2. `v0.2: clickable URLs in YAML frontmatter values` — 1 file
3. `v0.2: bake CHaiMPION header bar + footer into rendered HTML` — 1 file

Submodules are initialised in the local checkout (cmark-gfm pinned to `587a12b` since the original pin was force-pushed away from upstream).

## What's blocking the build

Tested with: Xcode 16.4, macOS 15.3.1, M3 Pro / 18 GB.

### Blocker 1 — Yams 6.2.1 + Xcode 16 build system collision

Yams 6.2.x ships Bazel files (`BUILD`, `MODULE.bazel`, `WORKSPACE`, and a top-level `build` ASCII file) at the package root. Xcode 16's new build system tries to create a `build/` directory at the same path during package compilation, which fails because there's a regular file named `build` blocking it.

**Symptom:**
```
error: File exists but is not a directory: .../SourcePackages/checkouts/Yams/build
error: File exists but is not a directory: .../SourcePackages/checkouts/Yams/build/EagerLinkingTBDs
```

**Fix options:**

- **A. Pin Yams to 5.4.0 or earlier** — older Yams releases predate the Bazel files. Edit `QLMarkdown.xcodeproj/project.pbxproj` to change the version constraint; or edit `Package.resolved` (less robust). Risk: Yams API may have moved.
- **B. Patch the SPM checkout** — rename `Yams/build` to something else after each `git submodule update`. Brittle; will keep regenerating.
- **C. Wait for Yams or Xcode fix** — known issue. Either Yams renames the Bazel file, or Xcode 17+ handles file/directory namespace differently.

Recommendation: **A** (pin to 5.4.0). Test that Yams 5.x API works with the project's `Yams.compose(yaml:)` calls in `Settings+render.swift:903`.

### Blocker 2 — Highlight library Makefile missing clean target on sub-Makefile

Xcode 16's external build phases (Legacy build targets) invoke `make $(ACTION)`, where `$(ACTION)` cycles `clean` then `build`. The `highlight-wrapper/highlight/makefile2.makefile` doesn't have a `clean` target, causing:

```
make[3]: *** No rule to make target `clean'.  Stop.
```

**Fix:**
Add a `clean:` target to `highlight-wrapper/highlight/makefile2.makefile` (or to `highlight-wrapper/highlight/src/makefile2.makefile`). Probably:
```make
clean:
	rm -f *.o liblua.a libhighlight.a
```

Or have the parent `highlight-wrapper/Makefile` swallow the clean call to its sub-makes.

### Blocker 3 — Code signing required for Quick Look Extension

QL Extensions are sandboxed on macOS and require a real provisioning profile (App Group entitlements need it). Pure ad-hoc signing (`CODE_SIGN_IDENTITY=-`) doesn't satisfy the system loader.

**Fix:**
Add Apple ID to Xcode → Settings → Accounts → +. This creates a free "Personal Team" cert that signs everything for local development. Works for personal use; doesn't ship to other machines without signing certs from those teams (or notarisation).

**For shipping to clients (long term):**
- Apple Developer Program ($99/year) → Developer ID cert → notarisation
- Or self-signed `.dmg` with explicit "right-click → Open" instructions for clients

### Blocker 4 — cmark-gfm submodule pin (already worked around locally)

The original pin (`c168d57`) no longer exists on upstream. Local checkout now uses `587a12b` (release `0.29.0.gfm.13`). To make this permanent, update `.gitmodules` and commit a new submodule SHA — but only do this if compatibility is verified.

## Recommended sequence to resume v0.2

1. Pin Yams to 5.4.0 in the project (Blocker 1)
2. Verify the project's Yams calls still compile (test cases probably exist in `Settings+render.swift`)
3. Patch the highlight makefile (Blocker 2) — small Makefile edit
4. Add Apple ID to Xcode (Blocker 3) — one click
5. Build via Xcode IDE (Cmd+B), iterate
6. Once green, archive → export → `create-dmg`
7. Test on a separate user account (verify spacebar render with our edits)
8. Tag `v0.2.0` and push as a GitHub release

Realistic time: 3-5 hours focused work.

## OS / Xcode upgrade implications

- **macOS 15.3.1 → 15.7.x** (within Sequoia): no impact on these blockers
- **macOS 15.x → 26.x** (next major, hypothetical): unknown — depends on Apple's build system changes
- **Xcode 16.4 → 17 (when it ships)**: may resolve Yams Bazel-file collision; may break other things
- **Xcode 16.4 → Xcode 15.4 (downgrade)**: would resolve Blockers 1+2, but loses macOS 15.5 SDK features (probably fine for this app)

For v0.2 ship: **don't upgrade. Just fix Blockers 1+2 directly.**

For long-term: track Yams upstream for a Bazel-file-rename release.
