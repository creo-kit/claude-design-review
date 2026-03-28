#!/usr/bin/env bash
set -euo pipefail

echo "Uninstalling creo-design-review..."

rm -f "$HOME/.claude/skills/creo-design-review/SKILL.md"
rmdir "$HOME/.claude/skills/creo-design-review" 2>/dev/null || true
rm -f "$HOME/.claude/agents/creo-design-review.md"

echo "Uninstalled creo-design-review."
