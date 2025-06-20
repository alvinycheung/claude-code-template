# Context Window Prime

RUN:

# Basic project analysis

- git ls-files
- find specs -name "_.md" -not -path "specs/completed/_"
- git log --oneline -10
- git branch --show-current
- git status --porcelain

READ:

# Core documents (always load)

- README.md
- specs/project-management.md
- specs/code-standards.md
- specs/project_plan.md
- specs/jira_integration.md

Always use conventional commits

# Note: JIRA issues should be loaded via MCP on demand when working on specific features/tasks
