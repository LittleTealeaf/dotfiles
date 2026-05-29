---
name: explore-git-repo
description: Clones, explores, and inspects third-party GitHub repositories locally to understand their codebase, structure, and implementation details. Use when the user asks to analyze or research an external git repository.
---

# Skill: Explore GitHub Repositories

This skill allows the agent to fetch and explore third-party GitHub repositories locally on the user's system without cluttering their main workspace.

## How to use this skill

1.  **Execute the Skill**: Call the script:
    ```bash
    ~/.gemini/config/skills/explore_git_repo/script.sh <repo_url>
    ```
2.  **What it does**:
    *   Creates a clean clone of only the latest commit (using `--depth 1` to save time/bandwidth) in `/tmp/explore_<repo_name>`.
    *   Prints a structural directory layout of the repository.
3.  **Next Steps**: After the script runs, you can navigate directly to the temporary path `/tmp/explore_<repo_name>` using research tools (like reading files, viewing directory structures) to answer questions, analyze architecture, or locate specific logic.
