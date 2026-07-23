#!/usr/bin/env bash
set -euo pipefail
repo="${1:-alvarofernandezmota-tech/yggdrasil-dew}"
gh repo set-default "$repo"
gh repo set-default --view
