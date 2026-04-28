# QLMarkdown-CHaiMPION — preconfigured Quick Look for markdown

Drop-in Mac Quick Look settings that make `.md` files with YAML frontmatter render
properly when you press the spacebar in Finder.

Built on [`sbarex/QLMarkdown`](https://github.com/sbarex/QLMarkdown) (MIT).

## What you get

When you press spacebar on a `.md` file in Finder, you'll see:

- YAML frontmatter rendered as a clean **two-column metadata table** at the top
- The actual content (headings, tables, code) rendered below
- No more giant collapsed paragraph at the top of every COS file

## Install (3 steps)

1. Download and install **QLMarkdown.app** from
   [the upstream releases](https://github.com/sbarex/QLMarkdown/releases) → drag to `/Applications/`
2. From this bundle directory, run:
   ```bash
   ./install.sh
   ```
3. In Finder, select `sample/sample-with-frontmatter.md` and press the spacebar.

That's it.

## Uninstall

```bash
./uninstall.sh
```

Restores the most recent settings backup the installer made.

## What the installer does

- Verifies `/Applications/QLMarkdown.app` is present
- Backs up any existing settings to `~/Library/Preferences/.qlmarkdown-chaimpion-backup/`
- Copies the preconfigured plist to `~/Library/Preferences/org.sbarex.QLMarkdownXPCHelper.plist`
- Refreshes the macOS Quick Look daemon (`qlmanage -r`)

## What's preconfigured

The bundled plist enables these defaults:

| Setting | Value | Why |
|---|---|---|
| `yaml` | `true` | Render YAML frontmatter |
| `yaml_all` | `true` | Apply to **all** `.md` files (not just `.rmd`/`.qmd`) |
| `table` | `true` | Required for YAML to render as a table |
| `autolink` | `true` | URLs in body become clickable |
| `syntax` | `true` | Syntax highlighting for fenced code |
| `math` | `true` | LaTeX math rendering |
| `footnote` | `true` | Footnote support |

The full plist is at `config/org.sbarex.QLMarkdownXPCHelper.plist`.

## Limits (v0.1)

This is the config-only ship. Code-level polish is on the roadmap:

- URLs **inside** YAML values aren't clickable yet
- No dark mode for the preview
- No type icons (Obsidian Properties style)
- No collapsible header/footer zones
- File-only — no folder browsing in Finder

See `ROADMAP.md` in the repo root for the plan.

## Credit

This bundle wraps the excellent
[`sbarex/QLMarkdown`](https://github.com/sbarex/QLMarkdown) by SBAREX
([buy them a coffee](https://www.buymeacoffee.com/sbarex)).
The CHaiMPION bundle adds preconfigured defaults and an installer; it does
**not** modify the upstream app.

## License

MIT — same as upstream. See `LICENSE.txt` in the repo root.
