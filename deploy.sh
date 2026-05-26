#!/bin/bash
# Deploy website/ to GitHub Pages
# Usage: bash website/deploy.sh
# Pre-requisite: gh auth login + repo created

set -e

REPO="viviengbedo-dot/epargn.github.io"
WEBSITE_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "▶ Deploying to GitHub Pages ($REPO)..."

# Create temp dir for clean gh-pages push
TMP=$(mktemp -d)
cp -r "$WEBSITE_DIR"/. "$TMP/"

cd "$TMP"
git init -b main
git add .
git commit -m "Deploy website $(date '+%Y-%m-%d %H:%M')"
git remote add origin "https://github.com/$REPO.git"
git push --force origin main

echo "✅ Deployed. Live at: https://epargnplus.com"
echo "   (DNS propagation: 2–24h after first deploy)"
rm -rf "$TMP"
