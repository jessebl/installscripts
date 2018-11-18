#!/usr/bin/env bash
set -euo pipefail

dl_dir=$HOME/Downloads

[[ -d $dl_dir ]] || echo "$dl_dir does not exist"; exit 1

# Move files in download directory to archive directory
# Make sure to not move archive dir into itself!
find "$dl_dir" -mindepth 1 -maxdepth 1 -exec trash {} +
