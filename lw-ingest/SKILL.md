---
name: lw-ingest
description: Use when a new source document is added to the raw/ folder and needs to be ingested into the LLM Wiki following the standard workflow.
---

# Wiki Ingest

This skill guides the process of ingesting new source documents (PDFs) from the `raw/` folder into the Obsidian-based wiki.

## Workflow

1. **Read**: Analyze the full source document in the `raw/` folder.
2. **Brainstorm (Hybrid Approach)**:
   - **Takeaways**: Present a summary of key findings (e.g., core concepts, categories).
   - **Conflict Check**: Proactively search the wiki for entities mentioned in the source to identify existing pages.
   - **Ingest Plan**: Present a table of proposed changes:
     | Page Path | Action | Description of Change | Conflict? |
     | :--- | :--- | :--- | :--- |
     | `wiki/path/Page.md` | Create/Update | Summary of changes | Yes/No (Explain if Yes) |
   - **Approval**: Wait for user approval of the Ingest Plan before proceeding.
3. **Decompose (Iterative Review)**:
   - For EACH new or updated file in the approved Ingest Plan:
     1. Present the FULL proposed content of the file to the user.
     2. Wait for explicit user approval for that specific file.
     3. Once approved, write/update the file in the wiki.
   - This iterative process applies to:
     - Source page in the sources folder (e.g., `wiki/sources/`).
     - Entity pages based on the domain (e.g., specific entity types).
     - Category or Topic pages.
   - **Note**: You may group very small, mechanical updates (like index/log entries) into a single final review if appropriate, but all content-heavy wiki pages MUST be reviewed individually.
4. **Link**: Ensure bidirectional linking between related entities using `[[page-name]]`.
5. **Log & Index (Integrity Check)**: 
   - **Pre-read**: ALWAYS read the full `wiki/index.md` and `wiki/log.md` files before editing to ensure you have the complete context and prevent accidental deletions.
   - **Completeness**: Ensure ALL newly created or updated pages are linked in the index under their respective categories.
   - Update `wiki/index.md` with a one-line summary and metadata tags.
     - **Append-only**: Never remove or overwrite unrelated entries.
     - **Metadata Format**: `[[Link]] | Summary. | (Tag1: Value, Tag2: Value)`
     - **Mandatory/Optional Tags**: Use tags appropriate for the entity type.
   - Append a parseable entry to `wiki/log.md`:
     ```markdown
     ## [YYYY-MM-DD] ingest | [[Source_Page_Name]]
     - Added: [[Entity 1]], [[Entity 2]]
     - Updated: [[Entity 3]]
     ```
6. **Reflect & Improve**: After the ingest is complete, analyze the conversation. 
   - **Update Domain Facts**: If any new general facts about the domain emerged during the ingest, you MUST update the domain facts file immediately.
   - **Update Configuration**: Identify if any wiki configuration (`GEMINI.md`, the `lw-ingest` skill itself, or templates) can be updated to streamline the process or clarify rules based on this session's experience.

A single source may touch 10-15 wiki pages. That is normal.

## Page Templates

To ensure consistency, always use the templates provided in the project configuration or templates directory.

## Rules for Ingestion

- **Project Conventions**: Always honor project-specific instructions, templates, and conventions (e.g., specified in `GEMINI.md`) regarding folder structures, naming, metadata, and language.
- **Append-only Files**: `wiki/index.md` and `wiki/log.md` are append-only. Never remove content unrelated to new source.
- **No Hallucinations**: NEVER add information that is not present in the current source document. Breaking this rule is a failure.
- **Precision over Filling**: Never add general information not present in the source. If data for a section is missing, use the appropriate placeholder.
- **Data Integrity on Update**: When adding information to an existing page, previous information must be either preserved or reformulated. Do not wipe out existing knowledge.
- **Conflict Resolution**: If new information contradicts existing information in the wiki, you MUST STOP and flag the contradiction to the user. Do not proceed with that page without explicit guidance.
- **Proactive Search**: You must search the wiki for existing pages *before* proposing the Ingest Plan to ensure you are aware of existing content.
- **Index Metadata**: Every entry in the index must have a one-line summary and minimalist tags in brackets `[...]`.
- **No H1 Titles**: Never add `# Title` at the beginning of a file (Obsidian uses the filename).
- **Source Naming**: Source information pages must match the raw filename.
- **Entity Disambiguation**: Disambiguate entities with common names.
- **Linking**: Use `[[page-name]]` for all entities.
- **Sources Section**: Every generated page MUST have a Sources section at the very bottom listing all sources used to generate the page.
- **New Concepts**: If a new type of entity or concept appears that does not fit current templates (e.g., a new category of information), you MUST STOP and discuss a new template with the user before creating any pages.
## Red Flags - STOP and Start Over

- **Batch Execution**: Writing multiple content pages to the wiki without individual approval.
- **Summary-only Review**: Asking for approval based on a summary of changes rather than the full file content.
- **"I'll show them at the end"**: Postponing the review until after the tools have been run.
- **Skipping "Boring" Files**: Failing to show a content page because it seems "obvious" or "small".

## Common Mistakes

- **Incorrect Source Naming**: Forgetting to follow project conventions for source page naming.
- **Missing Bidirectional Links**: Creating an entity page but forgetting to update the referenced page that links to it.
- **H1 Titles**: Adding a title like `# Page Title` at the top of the file (Obsidian uses the filename).
- **Index Pollution**: Removing or overwriting existing entries in `wiki/index.md` or `wiki/log.md`.
- **Domain Specific Hallucinations**: Avoid making assumptions specific to the domain without evidence in the source.
