# LLM Wiki Skills

This repository contains skills and guidelines for maintaining a wiki using LLM agents.

This set of tools was inspired by Andrej Karpathy's idea from [this gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f).

## Installation

To use these skills in your repository, add this repository as a git submodule and run the installation script.

### 1. Add as Submodule

Run the following command from the root of your git repository:

```bash
git submodule add git@github.com:oxddr/llm-wiki.git
```

### 2. Install Skills

Run the installation script to link the skills to your project:

```bash
./llm-wiki/install-skills.sh
```

This will create symlinks in `.gemini/skills` and `.agents/skills` pointing to the skills in this submodule.
