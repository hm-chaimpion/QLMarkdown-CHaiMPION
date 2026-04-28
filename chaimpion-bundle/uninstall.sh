#!/usr/bin/env bash
#
# QLMarkdown-CHaiMPION — restore previous settings
#

set -euo pipefail

PLIST_DST="${HOME}/Library/Preferences/org.sbarex.QLMarkdownXPCHelper.plist"
BACKUP_DIR="${HOME}/Library/Preferences/.qlmarkdown-chaimpion-backup"

if [ ! -d "${BACKUP_DIR}" ]; then
  echo "No backups found. Nothing to restore."
  exit 0
fi

LATEST=$(ls -t "${BACKUP_DIR}"/*.plist 2>/dev/null | head -1)
if [ -z "${LATEST}" ]; then
  echo "No backups found in ${BACKUP_DIR}. Nothing to restore."
  exit 0
fi

cp "${LATEST}" "${PLIST_DST}"
qlmanage -r >/dev/null 2>&1 || true
echo "Restored: ${LATEST}"
