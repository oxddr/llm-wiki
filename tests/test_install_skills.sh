#!/bin/bash

set -e

TEST_DIR=$(cd "$(dirname "$0")" && pwd)
LLM_WIKI_DIR=$(cd "$TEST_DIR/.." && pwd)

TEMP_DIR=$(mktemp -d)
echo "Created temp directory for testing: $TEMP_DIR"

cleanup() {
    echo "Cleaning up $TEMP_DIR"
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

# Run the install script targeting the temp directory
"$LLM_WIKI_DIR/install-skills.sh" "$TEMP_DIR"

echo "Verifying results..."

check_link() {
    local link_path="$1"
    local expected_target="$2"
    
    if [ ! -L "$link_path" ]; then
        echo "Error: $link_path is not a symlink"
        exit 1
    fi
    
    local actual_target=$(readlink "$link_path")
    echo "Link: $link_path -> $actual_target"
    
    local resolved_link=$(cd "$(dirname "$link_path")" && cd "$actual_target" && pwd)
    local resolved_expected=$(cd "$expected_target" && pwd)
    
    if [ "$resolved_link" != "$resolved_expected" ]; then
        echo "Error: Link resolves to $resolved_link, expected $resolved_expected"
        exit 1
    fi
    
    echo "Link verified."
}

SKILLS=("lw-ingest" "lw-lint" "lw-query" "lw-init")

for skill in "${SKILLS[@]}"; do
    check_link "$TEMP_DIR/.gemini/skills/$skill" "$LLM_WIKI_DIR/$skill"
    check_link "$TEMP_DIR/.agents/skills/$skill" "$LLM_WIKI_DIR/$skill"
done

echo "All tests passed."
