#!/usr/bin/env bash
# Copy scripts/templates/<group> to <group>/<name> and replace __NAME__.
set -euo pipefail

usage() {
  echo "usage: scripts/new-project.sh <js|php|rust|cpp|css|asm> <name>" >&2
  exit 1
}

if [[ $# -ne 2 ]]; then
  usage
fi

group="$1"
name="$2"
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
template="$root/scripts/templates/$group"
dest="$root/$group/$name"

case "$group" in
  js|php|rust|cpp|css|asm) ;;
  *)
    echo "unknown group: $group" >&2
    usage
    ;;
esac

if [[ ! "$name" =~ ^[a-z][a-z0-9-]*$ ]]; then
  echo "name must match ^[a-z][a-z0-9-]*$" >&2
  exit 1
fi

if [[ ! -d "$template" ]]; then
  echo "missing template: $template" >&2
  exit 1
fi

if [[ -e "$dest" ]]; then
  echo "already exists: $dest" >&2
  exit 1
fi

mkdir -p "$root/$group"
cp -R "$template" "$dest"

if sed --version >/dev/null 2>&1; then
  sed_inplace=(sed -i)
else
  sed_inplace=(sed -i "")
fi

while IFS= read -r -d "" file; do
  "${sed_inplace[@]}" "s/__NAME__/${name}/g" "$file"
done < <(find "$dest" -type f -print0)

echo "created $group/$name"
echo "if it serves traffic, set a free port and add a row to PORTS.md"
