# QLMarkdown-CHaiMPION (fork)

Fork of [`sbarex/QLMarkdown`](https://github.com/sbarex/QLMarkdown) (MIT) maintained by
[CHaiMPION](https://github.com/hm-chaimpion) for use in
[CHaiMPION Operating System (COS)](https://chaimpion.com) workflows.

## What this fork adds

- **`chaimpion-bundle/`** — preconfigured Quick Look settings + installer
  for non-technical users. Sets sensible defaults (YAML rendering enabled
  for all `.md` files, autolink, syntax highlighting, etc.) without
  requiring users to open the QLMarkdown.app preferences panel.

## What this fork does NOT change (yet)

The upstream app source is untouched. We only ship a settings bundle on
top of the released app. See `ROADMAP.md` for planned code-level changes.

## Quick start (clients / non-technical users)

1. Download `QLMarkdown.app` from
   [upstream releases](https://github.com/sbarex/QLMarkdown/releases) →
   drag to `/Applications/`
2. Download or clone this repo, navigate to `chaimpion-bundle/`
3. Run `./install.sh`

That's it. Spacebar any `.md` file in Finder.

## Repo layout

```
.                       — upstream sbarex/QLMarkdown source (untouched in v0.1)
├── chaimpion-bundle/   — CHaiMPION preconfigured installer (the v0.1 ship)
├── ROADMAP.md          — what's next
├── TODO.md             — immediate work items
└── CHAIMPION-README.md — this file
```

The original upstream README is at `README.md`.

## Credit & license

Built on [`sbarex/QLMarkdown`](https://github.com/sbarex/QLMarkdown) by SBAREX —
please [buy them a coffee](https://www.buymeacoffee.com/sbarex).
MIT — same as upstream. `LICENSE.txt` preserved unchanged.
