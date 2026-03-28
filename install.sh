#!/usr/bin/env bash
set -euo pipefail

REPO="https://github.com/creo-kit/claude-design-review.git"
TMP_DIR=""

cleanup() {
  if [ -n "$TMP_DIR" ] && [ -d "$TMP_DIR" ]; then
    rm -rf "$TMP_DIR"
  fi
}
trap cleanup EXIT

SKILL_DIR="$HOME/.claude/skills/creo-design-review"
AGENT_DIR="$HOME/.claude/agents"

echo "Installing creo-design-review..."

mkdir -p "$SKILL_DIR" "$AGENT_DIR"

TMP_DIR="$(mktemp -d)"
git clone --depth 1 "$REPO" "$TMP_DIR"

cp "$TMP_DIR/skills/creo-design-review/SKILL.md" "$SKILL_DIR/SKILL.md"
cp "$TMP_DIR/agents/creo-design-review.md" "$AGENT_DIR/creo-design-review.md"

echo "Installed creo-design-review successfully."
echo "  Skill: $SKILL_DIR/SKILL.md"
echo "  Agent: $AGENT_DIR/creo-design-review.md"
