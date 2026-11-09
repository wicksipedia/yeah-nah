#!/usr/bin/env bash
# Install the Bogan output style for Claude Code.
#   ./install.sh            install for your user (~/.claude/output-styles)
#   ./install.sh --project  install for the current project (./.claude/output-styles)
set -euo pipefail

REPO_RAW="https://raw.githubusercontent.com/wicksipedia/yeah-nah/main"
STYLE="bogan.md"

case "${1:-}" in
  --project) dest="$PWD/.claude/output-styles" ;;
  ""|--user) dest="$HOME/.claude/output-styles" ;;
  -h|--help) sed -n '2,4p' "$0"; exit 0 ;;
  *) echo "Unknown option: $1" >&2; exit 1 ;;
esac

mkdir -p "$dest"

# If curl pipes this script into bash, no local copy of the style exists, so download it.
src_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || true)"
if [[ -n "$src_dir" && -f "$src_dir/output-styles/$STYLE" ]]; then
  cp "$src_dir/output-styles/$STYLE" "$dest/$STYLE"
else
  curl -fsSL "$REPO_RAW/output-styles/$STYLE" -o "$dest/$STYLE"
fi

echo "Installed $dest/$STYLE"
echo "Restart Claude Code, then run: /output-style Bogan"
