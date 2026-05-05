---
name: lw-lint
description: Use to health-check the wiki and ensure compliance with conventions defined in GEMINI.md.
---

# Wiki Lint

This skill guides the process of checking the wiki for structural health, content consistency, and adherence to conventions defined in `GEMINI.md`.

## Workflow

1. **Read Configuration**:
   - ALWAYS read the full `GEMINI.md` file at the start of the session to understand the current conventions, rules, and templates. This ensures you are using the most up-to-date rules, as they may have changed.

2. **Scan & Analyze**:
   - **General Health**:
     - Look for contradictions between pages.
     - Identify stale claims that newer sources have superseded.
     - Find orphan pages (pages with no inbound links).
     - Identify important concepts mentioned but lacking their own page.
     - Check for missing cross-references.
     - Identify data gaps that could be filled with a web search (if appropriate).
   - **Fact Checking**:
     - Read the sources cited in the files being linted.
     - Validate that the claims made in the file are backed by the cited sources.
     - Report any contradictions or unsupported claims.
   - **Convention Compliance**:
     - Verify that files follow the folder structure defined in `GEMINI.md`.
     - Check that files adhere to naming conventions (e.g., full faction names, RON abbreviation).
     - Verify that pages follow the appropriate templates (Unit, Product, Source, Faction).
     - Ensure no files use H1 titles (`# Title`).
     - Confirm that all wiki content is in Polish.
     - Verify that `index.md` entries have the correct metadata format and required tags.

3. **Report**:
   - Present a summary of findings to the user, categorized by:
     - **Critical Issues** (e.g., broken links, missing templates, contradictions).
     - **Suggestions** (e.g., missing cross-references, orphan pages).
     - **Convention Violations** (e.g., incorrect naming, H1 titles).
   - For each issue, propose a specific fix.

4. **Fix Plan**:
   - Present a plan to fix the identified issues.
   - Wait for user approval before proceeding with changes.

5. **Execute**:
   - Apply approved fixes iteratively. For content-heavy changes, follow the review process (presenting the full content) before writing.

## Rules for Linting

- **Source of Truth**: `GEMINI.md` is the authoritative source for conventions. Never assume conventions without reading it in the current session.
- **No Assumptions**: When checking for contradictions or stale claims, rely on cited sources in the pages or ask the user if uncertain.
- **Preserve Content**: Do not delete content unless it is proven false or duplicate.
- **Bidirectional Integrity**: Ensure that links go both ways where appropriate.

## Red Flags - STOP and Start Over

- **Ignoring GEMINI.md**: Assuming you know the rules without reading the file in the current session.
- **Mass Deletion**: Proposing to delete files without strong justification and user approval.
- **Silent Fixes**: Making changes without reporting them and getting approval.

## Common Mistakes

- **Stale Rules**: Applying rules from memory that have changed in `GEMINI.md`.
- **Over-zealous Fixing**: Making changes without user approval or understanding the context.
