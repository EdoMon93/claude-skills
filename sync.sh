#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="$HOME/.claude/skills"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ ! -d "$SKILLS_DIR" ]; then
  echo "Skills directory not found: $SKILLS_DIR"
  exit 1
fi

# Sync each skill's SKILL.md into the repo
for skill_dir in "$SKILLS_DIR"/*/; do
  skill_name="$(basename "$skill_dir")"
  # Skip workspace directories
  [[ "$skill_name" == *-workspace ]] && continue
  skill_file="$skill_dir/SKILL.md"
  if [ -f "$skill_file" ]; then
    mkdir -p "$REPO_DIR/$skill_name"
    cp "$skill_file" "$REPO_DIR/$skill_name/SKILL.md"
    echo "Synced $skill_name"
  fi
done

# Commit and push if there are changes
cd "$REPO_DIR"
if [ -n "$(git status --porcelain)" ]; then
  git add -A
  git commit -m "Sync skills from ~/.claude/skills"
  git push
  echo "Pushed changes to remote."
else
  echo "No changes to sync."
fi
