#!/usr/bin/env bash
# Preview the site locally at http://localhost:4001
# (4000 is Jekyll's default but is already taken on this machine.)
# Uses the Ruby/Jekyll installed in the "website" conda env.
set -e
export PATH="/home/jiuzl/miniconda3/envs/website/bin:$PATH"
cd "$(dirname "$0")"
exec bundle exec jekyll serve --livereload --host 0.0.0.0 --port 4001 "$@"
