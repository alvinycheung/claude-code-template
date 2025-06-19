# Task Specification: Update /prime Command with Intelligent Loading

**Feature**: Enhanced Context Loading → `specs/features/enhanced-context-loading.md`
**Status**: [ ] **Todo**
**Priority**: High
**Estimated Effort**: Large (4-6 hours)
**Assigned**: Claude
**Created**: 2024-01-XX
**Updated**: 2024-01-XX

## Objective

Enhance the existing `/prime` command to intelligently detect project type, load relevant documentation, analyze project structure, and provide contextual information that helps Claude understand the project better.

## Context

This is the core task for the enhanced context loading feature. It builds upon the existing /prime command but adds intelligence to automatically understand what type of project we're working with and load appropriate context.

## Requirements

- [ ] Detect project type automatically (React, Node.js, Python, Next.js, etc.)
- [ ] Load project-specific documentation based on detection
- [ ] Analyze and summarize project structure
- [ ] Include recent git activity for context
- [ ] Load relevant configuration files intelligently
- [ ] Maintain performance with smart loading strategies

## Implementation Details

### Approach

1. Create project detection logic that checks for key indicator files
2. Update `.claude/commands/prime.md` with enhanced loading rules
3. Create project-specific documentation templates
4. Add git activity analysis commands
5. Implement smart file loading based on project type

### Technical Specifications

```markdown
# Project Type Detection (check in order):

- Next.js: next.config.js, app/ or pages/ directory
- React: package.json with react dependency, src/ directory
- Node.js: package.json with node dependencies, server files
- Python: requirements.txt, setup.py, pyproject.toml, .py files
- Vue: package.json with vue dependency
- Svelte: package.json with svelte dependency

# Smart Loading Rules:

- Always: README.md, specs/project_plan.md, ai_docs/project-management.md
- React/Next.js: package.json, tsconfig.json, tailwind.config.js
- Python: requirements.txt, pyproject.toml, main.py or app.py
- Node.js: package.json, .env.example, main entry file
```

### Files to Modify/Create

- [ ] `.claude/commands/prime.md` - Enhanced with intelligent loading
- [ ] `ai_docs/project-types/` - Directory for project-specific docs
- [ ] `ai_docs/project-types/react.md` - React-specific context
- [ ] `ai_docs/project-types/nodejs.md` - Node.js-specific context
- [ ] `ai_docs/project-types/python.md` - Python-specific context
- [ ] `ai_docs/project-types/nextjs.md` - Next.js-specific context

## Dependencies

- **Prerequisite Tasks**: None (this is the first task)
- **External Dependencies**: None
- **Blockers**: None

## Acceptance Criteria

- [ ] /prime command detects project type automatically
- [ ] Appropriate project-specific documentation is loaded
- [ ] Recent git commits (last 10) are included in context
- [ ] Current git branch and status are shown
- [ ] Key configuration files are detected and loaded
- [ ] Project structure summary is provided
- [ ] Performance remains under 5 seconds for typical projects
- [ ] System gracefully handles unknown project types
- [ ] All existing /prime functionality is preserved

## Testing

- [ ] Test with React project (should detect and load React docs)
- [ ] Test with Node.js project (should detect and load Node docs)
- [ ] Test with Python project (should detect and load Python docs)
- [ ] Test with unknown project type (should load generic context)
- [ ] Test performance with large project (100+ files)
- [ ] Test git analysis functionality

## Notes

- Start with most common project types (React, Node.js, Python, Next.js)
- Keep detection logic simple but accurate
- Ensure backward compatibility with existing /prime usage
- Focus on loading only the most relevant context to manage token usage

## Definition of Done

- [ ] Enhanced /prime command implemented and tested
- [ ] Project type detection working for common types
- [ ] Project-specific documentation created and loading
- [ ] Git analysis integrated and working
- [ ] Performance acceptable across different project sizes
- [ ] Task marked complete in feature spec
- [ ] Changes committed with proper spec-based message

## Changelog

- **2024-01-XX**: Initial task specification created

---

_This task spec will be moved to completed/ when implementation is finished_
