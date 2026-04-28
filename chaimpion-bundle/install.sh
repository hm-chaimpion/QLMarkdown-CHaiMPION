#!/usr/bin/env bash
#
# QLMarkdown-CHaiMPION — preconfigured Quick Look settings installer
# Sets sensible defaults for viewing markdown files with YAML frontmatter.
#
# Usage: ./install.sh
#
# What this does:
#   1. Verifies QLMarkdown.app is installed (downloads link if not)
#   2. Backs up any existing QLMarkdown settings
#   3. Installs preconfigured plist (YAML rendering enabled for all .md files)
#   4. Refreshes the macOS Quick Look daemon
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLIST_SRC="${SCRIPT_DIR}/config/org.sbarex.QLMarkdownXPCHelper.plist"
PLIST_DST="${HOME}/Library/Preferences/org.sbarex.QLMarkdownXPCHelper.plist"
BACKUP_DIR="${HOME}/Library/Preferences/.qlmarkdown-chaimpion-backup"

bold() { printf "\033[1m%s\033[0m\n" "$1"; }
ok() { printf "\033[32m✓\033[0m %s\n" "$1"; }
warn() { printf "\033[33m!\033[0m %s\n" "$1"; }
err() { printf "\033[31m✗\033[0m %s\n" "$1"; }

bold "QLMarkdown-CHaiMPION installer"
echo ""

# 1. Check QLMarkdown.app
if [ ! -d "/Applications/QLMarkdown.app" ]; then
  err "QLMarkdown.app not found in /Applications/"
  echo ""
  echo "  Download the latest release from:"
  echo "    https://github.com/sbarex/QLMarkdown/releases"
  echo ""
  echo "  Drag QLMarkdown.app to /Applications, then re-run this installer."
  exit 1
fi
ok "QLMarkdown.app found"

# 2. Backup existing settings if present
if [ -f "${PLIST_DST}" ]; then
  mkdir -p "${BACKUP_DIR}"
  BACKUP_FILE="${BACKUP_DIR}/$(date +%Y%m%d-%H%M%S).plist"
  cp "${PLIST_DST}" "${BACKUP_FILE}"
  ok "Existing settings backed up to: ${BACKUP_FILE}"
fi

# 3. Install preconfigured plist
if [ ! -f "${PLIST_SRC}" ]; then
  err "Bundled config not found at ${PLIST_SRC}"
  exit 1
fi
cp "${PLIST_SRC}" "${PLIST_DST}"
ok "Installed preconfigured settings"

# 4. Refresh Quick Look daemon
qlmanage -r >/dev/null 2>&1 || true
qlmanage -r cache >/dev/null 2>&1 || true
ok "Quick Look daemon refreshed"

echo ""
bold "Done."
echo ""
echo "  Test it:"
echo "    1. Open Finder"
echo "    2. Select any .md file with YAML frontmatter"
echo "    3. Press the spacebar"
echo "    4. The frontmatter should render as a clean two-column table"
echo ""
echo "  Sample file: ${SCRIPT_DIR}/sample/sample-with-frontmatter.md"
