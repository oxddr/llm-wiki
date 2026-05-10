---
name: lw-init
description: Use to create all files and directories needed for a new wiki.
---

# Wiki Init

This skill guides the process of initializing a new LLM Wiki in a target directory.

## Workflow

1. **Target Directory**: Ask the user for the target directory where the new wiki should be created. If no directory is specified, suggest a default like `wiki/`.

2. **Structure**: Create the following directory structure within the target directory:
   - `sources/`: For storing summaries of source documents.
   - `resources/`: For storing assets like extracted images.

3. **Core Files**:
   - Create `index.md` with initial content (e.g., placeholders for categories like Sources, Entities).
   - Create `log.md` with a first entry recording the initialization.
     - Format: `## [YYYY-MM-DD] init | Wiki initialized`

4. **Schema Configuration**:
   - Create a `GEMINI.md` file in the root of the target directory (or project root if preferred by the user) to define the conventions for this specific wiki.
   - This file should include:
     - Directory structure explanation.
     - Naming conventions for files.
     - Specific instructions for the LLM on how to handle this domain.
     - Reference to the generic skills (`lw-ingest`, `lw-lint`, `lw-query`) and how they apply.

## Rules for Initialization

- **No Overwrite**: If the target directory already contains files, do NOT overwrite them without explicit user confirmation.
- **Relative Paths**: Ensure all initial links (e.g., in templates or index) use relative paths.
- **Feedback**: Show the generated file content to the user for approval before writing, especially for `GEMINI.md`.

## Example GEMINI.md Template

```markdown
# [Wiki Name] - Agent Instructions

This file defines the conventions and workflows for maintaining this wiki.

## Folder Structure

- `wiki/`: Root of the wiki.
- `wiki/sources/`: Summaries of source documents.
- `wiki/resources/`: Assets and images.

## Conventions

- **File Naming**: Use descriptive names.
- **No H1 Titles**: Obsidian uses filenames as titles. Do not add `# Title` at the top of files.
- **Index Format**: `[[Link]] | Summary | (Metadata)`

## Workflows

- Use `lw-ingest` for adding new sources.
- Use `lw-lint` for health checks.
- Use `lw-query` for answering questions.
```
