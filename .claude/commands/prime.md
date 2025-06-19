# Context Window Prime

RUN:

# Basic project analysis

- git ls-files
- find specs -name "_.md" -not -path "specs/completed/_" -not -name "\_template.md"
- git log --oneline -10
- git branch --show-current
- git status --porcelain

# Project type detection and smart loading

- |
  echo "=== PROJECT ANALYSIS ==="
  # Detect project type
  if [ -f "next.config.js" ] || [ -d "app" ] || [ -d "pages" ]; then
  echo "PROJECT_TYPE: Next.js"
  PROJECT_TYPE="nextjs"
  elif [ -f "package.json" ] && grep -q '"react"' package.json 2>/dev/null; then
  echo "PROJECT_TYPE: React"
  PROJECT_TYPE="react"
  elif [ -f "package.json" ] && grep -q '"vue"' package.json 2>/dev/null; then
  echo "PROJECT_TYPE: Vue.js"
  PROJECT_TYPE="vue"
  elif [ -f "requirements.txt" ] || [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
  echo "PROJECT_TYPE: Python"
  PROJECT_TYPE="python"
  elif [ -f "package.json" ]; then
  echo "PROJECT_TYPE: Node.js"
  PROJECT_TYPE="nodejs"
  else
  echo "PROJECT_TYPE: Generic"
  PROJECT_TYPE="generic"
  fi
  echo "=== END PROJECT ANALYSIS ==="

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

# Project-specific documentation

- ai_docs/project-types/${PROJECT_TYPE}.md

# Smart configuration loading based on project type

# Next.js/React projects

- next.config.js
- package.json
- tsconfig.json
- tailwind.config.js

# Python projects

- requirements.txt
- pyproject.toml
- setup.py

# Node.js projects

- package.json
- .env.example

# Vue projects

- vite.config.js
- vue.config.js

# Generic projects

- Makefile
- docker-compose.yml

# Note: Task specs should be loaded individually when needed to avoid token bloat
