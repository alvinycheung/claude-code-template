# AI-Assisted Hierarchical Project Management System

## Overview

This document outlines the hierarchical project management system designed to help Claude track requests, manage tasks efficiently, and optimize token usage. The system uses a multi-level specification structure with automatic archiving of completed work.

## File Structure & Hierarchy

```
specs/
├── project_plan.md              # Main project overview (Level 1)
├── feature-[name].md            # Feature specifications (Level 2)
├── component-[name].md          # Component/module specs (Level 3)
├── task-[name].md              # Granular task breakdowns (Level 3)
└── completed/                  # Archived completed specs
    ├── [date]-[original-name].md
    └── ...
```

## Core Principles

### 1. **Token Efficiency**

- `/prime` command only reads active (non-completed) specs
- Completed specs moved to `specs/completed/` with timestamp prefix
- Each spec file should be focused and concise (< 1000 tokens when possible)
- Use cross-references instead of duplicating information

### 2. **Hierarchical Organization**

- **Level 1 (project_plan.md)**: High-level project overview, major milestones, and current phase
- **Level 2 (feature-\*.md)**: Detailed feature specifications and requirements
- **Level 3 (component-_.md, task-_.md)**: Granular implementation details and task breakdowns

### 3. **Active Request Tracking**

- Each spec file maintains its own status section
- Active requests are tracked in the relevant spec level
- Cross-file dependencies are explicitly documented

## Workflow Rules for Claude

### 1. **Session Start & Task Identification**

**When USER asks "What should we work on next?" or starts a new session:**

1. **Always read `specs/project_plan.md` first** to understand current project state
2. **Identify the active phase** and next logical tasks
3. **Check for any blocked tasks** and suggest alternatives if needed
4. **Propose specific next steps** based on current priority

### 2. **Request Processing & Documentation**

**When USER makes a new request:**

1. **Determine appropriate spec level:**

   - New major feature → Create `feature-[name].md`
   - Component/module work → Create `component-[name].md`
   - Specific task → Create `task-[name].md` or add to existing spec

2. **Document the request immediately:**

   - Add to appropriate spec file with `[ ]` checkbox
   - Include context, acceptance criteria, and dependencies
   - Update `project_plan.md` with reference to new spec if needed

3. **Confirm understanding:**
   - Summarize what you've documented
   - Ask for clarification if needed
   - Propose implementation approach

### 3. **Task Completion & Status Updates**

**When completing tasks:**

1. **Update task status** in the relevant spec file (`[x]`)
2. **Commit spec changes** with descriptive message
3. **If entire spec is complete:**
   - Move to `specs/completed/[YYYY-MM-DD]-[original-name].md`
   - Update references in `project_plan.md`
   - Commit the move operation

**Commit Message Format:**

```
docs(specs): Update [spec-name] - [brief description]
docs(specs): Complete [spec-name] - moved to completed/
```

### 4. **Cross-Reference Management**

**When specs reference each other:**

- Use relative paths: `See [Feature X](./feature-x.md#section)`
- For completed specs: `See [Feature X](./completed/2024-01-15-feature-x.md)`
- Update all references when moving specs to completed/

## Spec File Templates

### project_plan.md Template

```markdown
# Project Plan: [Project Name]

## Current Status

- **Phase:** [Current Phase]
- **Active Sprint:** [Sprint Name/Number]
- **Last Updated:** [Date]

## High-Level Roadmap

- [ ] Phase 1: [Description]
- [ ] Phase 2: [Description]
- [ ] Phase 3: [Description]

## Active Features

- [Feature A](./feature-a.md) - Status: In Progress
- [Feature B](./feature-b.md) - Status: Planning

## Current Priority Tasks

1. [ ] [High priority task] (See: [spec-file.md](./spec-file.md))
2. [ ] [Medium priority task]

## Blocked Items

- [ ] [Blocked task] - BLOCKED: [Reason]

## Completed This Session

- [x] [Recently completed item]

## Notes & Decisions

- [Important project decisions and context]
```

### feature-[name].md Template

```markdown
# Feature: [Feature Name]

## Overview

[Brief description of the feature]

## Requirements

- [ ] [Requirement 1]
- [ ] [Requirement 2]

## Implementation Tasks

- [ ] [Task 1] → See [task-[name].md](./task-[name].md)
- [ ] [Task 2]

## Dependencies

- Depends on: [Other features/components]
- Blocks: [What this blocks]

## Acceptance Criteria

- [ ] [Criteria 1]
- [ ] [Criteria 2]

## Status

- **Created:** [Date]
- **Status:** [Planning/In Progress/Testing/Complete]
- **Assigned to:** [Person/Claude]

## Notes

[Implementation notes, decisions, and context]
```

## Token Optimization Strategies

### 1. **Smart File Splitting**

- Keep each spec file under 1000 tokens when possible
- Split large features into multiple component specs
- Use references instead of duplicating information

### 2. **Completion Archiving**

- Move completed specs to `completed/` directory immediately
- Use timestamp prefixes for easy sorting: `2024-01-15-feature-auth.md`
- `/prime` command ignores completed directory by default

### 3. **Context Preservation**

- Keep essential context in `project_plan.md`
- Use cross-references to maintain relationships
- Archive with enough context for future reference

### 4. **Active Request Tracking**

```markdown
## Active Requests (Current Session)

1. [ ] [Request from user] - [Timestamp] - [Status]
2. [ ] [Follow-up task] - [Timestamp] - [Status]

## Completed This Session

- [x] [Completed request] - [Timestamp]
```

## Integration with /prime Command

The `/prime` command should be updated to:

1. **Always read** `specs/project_plan.md`
2. **Read all active specs** in `/specs/` (excluding `completed/`)
3. **Skip completed directory** entirely
4. **Provide summary** of current project state and next tasks

## Best Practices

1. **Be Proactive**: Document requests immediately, don't wait
2. **Stay Focused**: Each spec should have a single clear purpose
3. **Update Frequently**: Keep status current throughout the session
4. **Archive Promptly**: Move completed work to reduce /prime token usage
5. **Cross-Reference**: Maintain relationships between specs
6. **Communicate**: Always confirm understanding before proceeding

This system ensures efficient tracking while keeping token usage manageable and maintaining clear project visibility.
