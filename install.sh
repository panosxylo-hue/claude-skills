#!/bin/bash
# Copies every skill in this repo into ~/.claude/skills (skips ones already there).
set -e
SRC="$(cd "$(dirname "$0")" && pwd)/skills"
mkdir -p ~/.claude/skills
for s in "$SRC"/*/; do
  n=$(basename "$s")
  [ -e ~/.claude/skills/"$n" ] || cp -r "$s" ~/.claude/skills/
done
grep -q graphify ~/.claude/CLAUDE.md 2>/dev/null || cat "$(dirname "$0")/CLAUDE.md" >> ~/.claude/CLAUDE.md
