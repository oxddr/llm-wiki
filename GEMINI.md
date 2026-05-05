# LLM Wiki - Agent Instructions

This repository contains generic skills and documentation for maintaining a personal knowledge base (wiki) using LLMs.

## Repository Structure

- `lw-ingest/`: Skill for ingesting new sources into a wiki.
- `lw-query/`: Skill for answering questions based on wiki content.
- `docs/`: Generic documentation about the LLM Wiki concept.

Every skill is contained in a directory with a `SKILL.md` file defining its workflow and rules.

## Core Principles

- **Alignment with Vision**: Any changes to this repository must be aligned with the "LLM Wiki" concept described in [llm-wiki.md](docs/llm-wiki.md). The core idea is to build and maintain a persistent, compounding knowledge base from raw sources, rather than just doing query-time RAG.
- **No Wiki-Specific Instructions**: You must never add instructions specific to any particular wiki to this repository (i.e. skills). Be careful as this repo may be added as a submodule to other repositories which actual contain specific wikis.