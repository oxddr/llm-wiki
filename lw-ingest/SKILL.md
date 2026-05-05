---
name: lw-ingest
description: Use when a new source document is added to the raw/ folder and needs to be ingested into the LLM Wiki following the standard workflow.
---

# Wiki Ingest

This skill guides the process of ingesting new source documents (PDFs) from the `raw/` folder into the Obsidian-based wiki.

## Workflow

1. **Read**: Analyze the full source document in the `raw/` folder.
2. **Brainstorm (Hybrid Approach)**:
   - **Takeaways**: Present a summary of key findings (units, products, modeling tips).
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
     - Source page in `wiki/sources/`.
     - Unit pages in `wiki/jednostki/[frakcja]/`.
     - Product pages in `wiki/produkty/`.
     - Workshop pages in `wiki/warsztat/`.
     - Faction pages.
   - **Note**: You may group very small, mechanical updates (like index/log entries) into a single final review if appropriate, but all content-heavy wiki pages MUST be reviewed individually.
4. **Link**: Ensure bidirectional linking between Units <-> Products <-> Sources using `[[page-name]]`.
5. **Log & Index (Integrity Check)**: 
   - **Pre-read**: ALWAYS read the full `wiki/index.md` and `wiki/log.md` files before editing to ensure you have the complete context and prevent accidental deletions.
   - **Completeness**: Ensure ALL newly created or updated pages (Units, Sources, Factions, Workshop) are linked in the index under their respective categories.
   - Update `wiki/index.md` with a one-line summary and metadata tags.
     - **Append-only**: Never remove or overwrite unrelated entries.
     - **Metadata Format**: `[[Link]] | Summary. | (Tag1: Value, Tag2: Value)`
     - **Mandatory for Units/Products**: `Edycja` (1, 2, or 1&2), `Frakcja`.
     - **Optional**: `Materiał` (only if NOT metal), `Typ`, `Temat`, `Data`.
   - Append a parseable entry to `wiki/log.md`:
     ```markdown
     ## [YYYY-MM-DD] ingest | [[Source_Page_Name]]
     - Added: [[Entity 1]], [[Entity 2]]
     - Updated: [[Entity 3]]
     ```
6. **Reflect & Improve**: After the ingest is complete, analyze the conversation. 
   - **Update Domain Facts**: If any new general facts about the game (new editions, faction statuses, SKU formats, scale, materials) emerged during the ingest, you MUST update `oim-fakty.md` immediately.
   - **Update Configuration**: Identify if any wiki configuration (`GEMINI.md`, the `lw-ingest` skill itself, or templates) can be updated to streamline the process or clarify rules based on this session's experience.

A single source may touch 10-15 wiki pages. That is normal.

## Page Templates

To ensure consistency, always use the templates provided in [references/templates.md](references/templates.md).

## Rules for Ingestion

- **Append-only Files**: `wiki/index.md` and `wiki/log.md` are append-only. Never remove content unrelated to new source.
- **No Hallucinations**: NEVER add information that is not present in the current source document. Breaking this rule is a failure.
- **Precision over Filling**: Never add general information not present in the source. If data for a section is missing, use the placeholder `(brak danych)`.
- **Faction Hierarchy**: For meta-factions like RON (Rzeczpospolita Obojga Narodów), always assign units to the specific sub-faction (Korona or Litwa).
- **Terminology & Edition**: The presence of terms like "Zgrupowanie" or "PS" does not automatically mean 2nd edition. Always verify edition from source context.
- **Data Integrity on Update**: When adding information to an existing page, previous information must be either preserved or reformulated. Do not wipe out existing knowledge.
- **Conflict Resolution**: If new information contradicts existing information in the wiki, you MUST STOP and flag the contradiction to the user. Do not proceed with that page without explicit guidance.
- **Proactive Search**: You must search the wiki for existing pages *before* proposing the Ingest Plan to ensure you are aware of existing content.
- **Index Metadata**: Every entry in `index.md` must have a one-line Polish summary and minimalist tags in brackets `[...]`. Edition and Faction are mandatory for units/products.
- **No H1 Titles**: Never add `# Title` at the beginning of a file (Obsidian uses the filename).
- **Source Naming**: Files in `wiki/sources/` must match the `raw/` filename but replace the dot before the extension with an underscore (e.g., `Armia_Kurlandzka_pdf.md`).
- **Faction Names**: Always use full, official faction names (e.g., `Księstwo Kurlandii i Semigalii`). Faction filenames in `frakcje/` must be capitalized.
- **Unit Disambiguation**: Units with common names must include the faction in parentheses (e.g., `Rajtaria (Gdańsk)`), unless they are unique to that faction.
- **Faction Isolation**: Create separate unit pages for each faction even if they share names (e.g., separate pages for `Rajtaria (Kurlandia)` and `Rajtaria (Gdańsk)`).
- **Historical Depth**: Always extract specific names of commanders, regiments, and historical compositions (OOB) if available in the source.
- **Historical Model Integrity**: For historical figures/units, never suggest replacing them with other models in the game.
- **Special Models**: Always create a dedicated product page using a product-like template for special/limited models, even if they lack an SKU.
- **Cross-Edition**: Units have one shared page. Clearly separate 1ed and 2ed requirements.
- **Linking**: Use `[[page-name]]` for all entities.
- **Sources Section**: Every faction, unit, product, or workshop page MUST have a `## Źródła` section at the very bottom listing all sources used to generate the page (e.g., `- [[Nazwa_Zrodla_pdf]]`).
- **Language**: Write in clear, plain Polish for all wiki content.
- **New Concepts**: If a new type of entity or concept appears that does not fit current templates (e.g., a new category of information), you MUST STOP and discuss a new template with the user before creating any pages.
## Red Flags - STOP and Start Over

- **Batch Execution**: Writing multiple content pages to the wiki without individual approval.
- **Summary-only Review**: Asking for approval based on a summary of changes rather than the full file content.
- **"I'll show them at the end"**: Postponing the review until after the tools have been run.
- **Skipping "Boring" Files**: Failing to show a unit or product page because it seems "obvious" or "small".

## Common Mistakes

- **Incorrect Source Naming**: Forgetting to replace the dot with an underscore in `wiki/sources/` filenames.
- **Missing Bidirectional Links**: Creating a unit page but forgetting to update the product page that references it.
- **H1 Titles**: Adding a title like `# Rajtaria` at the top of the file (Obsidian uses the filename).
- **Index Pollution**: Removing or overwriting existing entries in `wiki/index.md` or `wiki/log.md`.
- **Hallucinating 2ed**: Assuming 2nd edition just because the source is recent; always check context for "Zgrupowania" vs "Dywizje".
