#!/bin/bash

set -e

TARGET_DIR="${1:-.}"
TARGET_DIR=$(cd "$TARGET_DIR" && pwd)

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

GEMINI_SKILLS_DIR="$TARGET_DIR/.gemini/skills"
AGENTS_SKILLS_DIR="$TARGET_DIR/.agents/skills"

mkdir -p "$GEMINI_SKILLS_DIR"
mkdir -p "$AGENTS_SKILLS_DIR"

get_relative_path() {
    python3 -c "import os; import sys; print(os.path.relpath(sys.argv[1], sys.argv[2]))" "$1" "$2"
}

echo "Installing skills from $SCRIPT_DIR to $TARGET_DIR"

# Find directories containing SKILL.md
find "$SCRIPT_DIR" -maxdepth 2 -name "SKILL.md" | while read -r skill_file; do
    skill_dir=$(dirname "$skill_file")
    skill_name=$(basename "$skill_dir")
    
    if [ "$skill_dir" = "$SCRIPT_DIR" ]; then
        continue
    fi
    
    echo "Installing skill: $skill_name"
    
    # Compute relative paths
    rel_gemini=$(get_relative_path "$skill_dir" "$GEMINI_SKILLS_DIR")
    rel_agents=$(get_relative_path "$skill_dir" "$AGENTS_SKILLS_DIR")
    
    # Create symlinks
    ln -sfn "$rel_gemini" "$GEMINI_SKILLS_DIR/$skill_name"
    ln -sfn "$rel_agents" "$AGENTS_SKILLS_DIR/$skill_name"
done

echo "Skill installation complete."
