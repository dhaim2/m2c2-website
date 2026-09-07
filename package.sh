#!/bin/sh
# Bundles the deployable site into dist/ and a dated zip for upload to any static host.
# Deployable = the HTML pages, css/, js/, assets/, programs/, robots.txt, .nojekyll.
# Left out on purpose: source/ (private originals), data/ + build.py (build inputs), docs, git.
set -e
cd "$(dirname "$0")"
python3 build.py >/dev/null
rm -rf dist && mkdir dist
cp index.html workshops.html network.html 404.html robots.txt .nojekyll CNAME dist/
cp -R css js assets programs dist/
STAMP=$(date +%Y-%m-%d)
rm -f "m2c2-site-$STAMP.zip"
(cd dist && zip -qr "../m2c2-site-$STAMP.zip" . -x '.DS_Store' '*/.DS_Store')
echo "dist/ ready — m2c2-site-$STAMP.zip ($(du -sh "m2c2-site-$STAMP.zip" | cut -f1))"
