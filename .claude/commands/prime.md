# Context Window Prime

RUN:

# Basic project analysis

- git ls-files
- find specs -name "_.md" -not -path "specs/completed/_" -not -name "\_template.md"
- git log --oneline -10
- git branch --show-current
- git status --porcelain

READ:

# Core documents (always load)

- README.md
- ai_docs/project-management.md
- ai_docs/code-standards.md
- specs/project_plan.md
- specs/completed/archive-index.md

READ_IF_EXISTS:

# Active specs (only if they exist)

- specs/features/\*.md

# Note: Task specs should be loaded individually when needed to avoid token bloat
