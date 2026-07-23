#!/usr/bin/env bash
set -euo pipefail
command -v ollama >/dev/null && ollama ls || true
command -v ollama >/dev/null && ollama ps || true
command -v gh >/dev/null && gh auth status || true
git status --short || true
