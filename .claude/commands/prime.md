# Context Window Prime

RUN:

- git ls-files
- find specs -name "_.md" -not -path "specs/completed/_" -not -name "\_template.md"

READ:

- README.md
- ai_docs/project-management.md
- specs/project_plan.md
- specs/completed/archive-index.md

READ_IF_EXISTS:

# Active feature specs (only if they exist)

- specs/features/\*.md

# Active task specs (only if working on specific tasks)

# Note: Task specs should be loaded individually when needed to avoid token bloat
