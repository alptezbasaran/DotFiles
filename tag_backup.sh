#!/usr/bin/env bash
set -euo pipefail

tag="backup-$(date +%Y%m%d-%H%M)"

git add -A
if ! git diff --cached --quiet; then
  echo "🔍  Committing unstaged changes before tagging…"
  git commit -m "Backup on $(date -Iseconds)"
fi

git tag "$tag"

echo "✅  Created git tag $tag" 