# Context Window Prime

RUN:

- git ls-files
- find specs/ -name "_.md" -not -path "specs/completed/_" | head -10

READ:

- README.md
- ai_docs/project-management.md
- specs/project_plan.md

READ_IF_EXISTS:

- specs/feature-\*.md
- specs/component-\*.md
- specs/task-\*.md

SUMMARY:

Provide a concise summary of:

1. Current project phase and active tasks from specs/project_plan.md
2. Any blocked items or pending requests
3. Next recommended actions based on project status
