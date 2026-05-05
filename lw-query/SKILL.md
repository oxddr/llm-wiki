---
name: lw-query
description: Use when the user asks a question about the wiki content.
---

# Wiki Query

This skill guides the process of answering questions using the wiki content.

## Workflow

1. **Read Index**: Read `wiki/index.md` first to find relevant pages.
2. **Read Pages**: Read those pages and synthesize an answer.
3. **Cite Sources**: Cite specific wiki pages in your response.
4. **Offer to Save**: If the answer is valuable, offer to save it as a new wiki page.

## Rules for Querying

- **Alignment with Vision**: Ensure answers contribute to the "compounding artifact" concept described in [llm-wiki.md](../docs/llm-wiki.md). If a synthesis or comparison is created, it should be suitable for saving back to the wiki.
- **No Hallucinations**: Do not invent facts. Base answers strictly on the wiki content. If the answer is not in the wiki, state it clearly.
- **Bidirectional Links**: Use `[[page-name]]` when citing wiki pages or referencing entities to maintain the interlinked structure.
- **Output Diversity**: Answers can take different forms depending on the question (e.g., a markdown page, a comparison table, or a list). Choose the format that best serves the answer and potential future storage in the wiki.
- **Proactive Saving**: If an answer provides a valuable synthesis or new connection, you MUST offer to save it as a new wiki page.
