#!/usr/bin/env bash
set -euo pipefail
repo="${1:-$PWD}"
cd "$repo"
mkdir -p docs/STATE
out="docs/STATE/$(date +%F-%H%M)-session-close.md"
{
  echo "# Session close"
  echo
  echo "## Estado"
  git status --short
  echo
  echo "## Commits"
  git log --oneline -n 10
} > "$out"
echo "$out"
