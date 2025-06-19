# AI-Assisted Project Management System

## Overview

This document outlines a comprehensive system for managing Claude (AI assistant) across complex projects. It uses a hierarchical specification system designed for efficiency, clarity, and token optimization.

## Core Philosophy

- **Hierarchical Planning**: Break complex projects into manageable layers
- **Token Efficiency**: Only load active specs, reference completed ones when needed
- **Status Tracking**: Clear indicators for progress and blockers
- **Contextual Memory**: Help Claude maintain context across sessions
- **Proactive Management**: Enable Claude to suggest next steps and identify dependencies

## File Structure & Hierarchy

```
specs/
├── project_plan.md             # Master project overview (ALWAYS ACTIVE)
├── features/                   # Major feature specifications
│   ├── auth-system.md          # Example: Authentication feature spec
│   ├── user-dashboard.md       # Example: Dashboard feature spec
│   └── api-integration.md      # Example: API integration spec
├── tasks/                      # Granular task breakdowns
│   ├── auth-system/            # Tasks related to Authentication feature
│   │   ├── setup-supabase.md   # Specific implementation tasks
│   │   └── login-ui.md         # UI-specific tasks
│   └── user-dashboard/         # Tasks related to dashboard feature
└── completed/                  # Archived completed work
    ├── features/               # Completed feature specs
    ├── tasks/                  # Completed task specs
    └── archive-index.md        # Quick reference to completed work
```

## Specification Levels

### Level 1: Master Project Plan (`specs/project_plan.md`)

- **Purpose**: High-level project overview and phase management
- **Always loaded**: This file is read by `/prime` command every session
- **Contains**: Project goals, major phases, current focus, dependencies
- **Updates**: When major milestones are reached or project direction changes

### Level 2: Feature Specifications (`specs/features/`)

- **Purpose**: Detailed specs for major features or components
- **Loaded when**: Working on specific features or when referenced
- **Contains**: Feature requirements, user stories, technical approach, dependencies
- **Lifecycle**: Active → Review → Complete → Archive

### Level 3: Task Specifications (`specs/tasks/`)

- **Purpose**: Granular, actionable tasks with implementation details
- **Loaded when**: Actively working on specific tasks
- **Contains**: Step-by-step instructions, code examples, acceptance criteria
- **Lifecycle**: Todo → In Progress → Review → Complete → Archive

## Claude's Responsibilities

### Session Start Protocol

1. **Always read** `specs/project_plan.md` first
2. **Check status** of current phase and active features
3. **Identify** next logical task or ask for direction
4. **Load relevant** feature/task specs as needed
5. **Surface blockers** or dependencies requiring attention

### Task Management Workflow

#### Adding New Work

```markdown
# When USER requests new work:

1. Determine appropriate level (project/feature/task)
2. Ask: "Should I create a new [feature/task] spec for this?"
3. If yes, create spec file with proper naming
4. Update project_plan.md with reference
5. Commit with spec-based prefix:
   - "spec([feature-name]): Create [feature] specification"
   - "project: Add [feature] to project plan"
```

#### Working on Tasks

```markdown
# When actively working:

1. Update task status: [ ] → [🔄] → [✅] → Archive
2. Note any blockers: [🚫 Blocked: reason]
3. Track dependencies: [⏳ Waiting: dependency]
4. Update related specs as needed
5. Commit when task completed:
   - "task([feature-name]): Complete [task-name] [brief-description]"
```

#### Completing Work

```markdown
# When work is completed:

1. Mark all related tasks as complete [✅]
2. Update feature spec status
3. Move to appropriate completed/ directory
4. Update archive-index.md with summary
5. Update project_plan.md with progress
6. Commit with spec-based prefix:
   - "feature([feature-name]): Complete [feature] - move to archive"
   - "project: Update project plan with completed milestone"
```

### Status Icons & Conventions

```markdown
# Project/Feature Status

🎯 **Active** - Currently working on
📋 **Planned** - Specified but not started
🔄 **In Progress** - Work has begun
👀 **Review** - Ready for review/testing
✅ **Complete** - Finished and working
🚫 **Blocked** - Cannot proceed (reason required)
⏳ **Waiting** - Dependent on other work
❄️ **On Hold** - Deliberately paused
❌ **Cancelled** - No longer needed

# Task Checklist Status

[ ] Todo
[🔄] In Progress
[👀] Ready for Review
[✅] Complete
[🚫] Blocked
[⏳] Waiting
[❌] Cancelled
```

## Token Optimization Strategies

### Smart Loading

- **Always load**: `project_plan.md` (master overview)
- **Load on demand**: Feature specs when working on features
- **Load granular**: Task specs only when actively implementing
- **Reference only**: Completed specs (don't load full content unless needed)

### Archive Strategy

```markdown
# Move to completed/ when:

- Feature is fully implemented and tested
- Task is complete and integrated
- Spec is no longer needed for reference

# Keep links to completed work in:

- project_plan.md (major milestones)
- archive-index.md (searchable reference)
- Related active specs (dependencies)
```

### Context Preservation

```markdown
# Each spec should include:

- **Related Work**: Links to dependent/related specs
- **Completion Date**: When moved to archive
- **Key Decisions**: Important choices made during development
- **Lessons Learned**: Notes for future similar work
```

## Example Workflows

### Starting New Feature

```markdown
1. USER: "Let's add user authentication"
2. CLAUDE: "I'll create a feature spec for this. Should I include social auth?"
3. Create: `specs/features/auth-system.md`
4. Update: `specs/project_plan.md` with new feature
5. Break down: Create task specs in `specs/tasks/auth-system/`
6. Commit: "spec(auth-system): Create authentication system specification"
```

### Daily Workflow

```markdown
1. Load `specs/project_plan.md`
2. Check current phase and active features
3. Review any blocked/waiting items
4. Propose next logical task
5. Load relevant task spec
6. Execute work and update status
7. Commit progress regularly as tasks are completed
```

### Completing Major Work

```markdown
1. Mark all related tasks complete [✅]
2. Update feature spec with final status
3. Move feature spec to `specs/completed/features/`
4. Move task specs to `specs/completed/tasks/`
5. Update `specs/completed/archive-index.md`
6. Update `specs/project_plan.md` with milestone
7. Commit: "feature(auth-system): Complete auth system - archive specs"
```

## Commit Message Convention

**CRITICAL**: All commits when completing work must use spec-based prefixes to immediately identify which spec file contains the completed task.

### Format

```
[spec-type]([spec-name]): [Action] [description]
```

### Spec Types & Examples

```markdown
# Task Completion (most common)

task(auth-system): Complete setup-supabase implementation
task(user-dashboard): Complete profile-page UI components
task(payment-system): Complete stripe-integration testing

# Feature Completion

feature(auth-system): Complete authentication feature - ready for testing
feature(user-dashboard): Complete dashboard feature - all tasks done

# Project Plan Updates

project: Update project plan - mark Phase 1 complete
project: Add new Phase 2 requirements

# Spec File Management

spec(auth-system): Create authentication feature specification
spec(auth-system): Move auth-system to completed archive
spec(payment): Update payment feature spec with new requirements
```

### When to Commit

```markdown
# MUST commit when:

- Task marked complete [✅] in any spec
- Feature marked complete [✅] in project plan
- Spec moved to completed/ archive
- Project plan updated with milestone

# Commit message tells you exactly:

- Which spec file to check: task(auth-system) = specs/tasks/auth-system/
- What was completed: the task name in the commit
- When it happened: git commit timestamp
```

### Tracing Commits to Specs

```markdown
# From commit message "task(auth-system): Complete setup-supabase"

→ Check: specs/tasks/auth-system/setup-supabase.md
→ Or if archived: specs/completed/tasks/[date]\_auth-system_setup-supabase.md

# From commit message "feature(user-dashboard): Complete dashboard feature"

→ Check: specs/features/user-dashboard.md
→ Or if archived: specs/completed/features/[date]\_user-dashboard.md

# From commit message "project: Update Phase 2 requirements"

→ Check: specs/project_plan.md
```

## File Naming Conventions

```markdown
# Project Plan

project_plan.md

# Features (descriptive, hyphenated)

user-authentication.md
admin-dashboard.md
payment-integration.md

# Tasks (feature-grouped, specific)

auth-system/setup-supabase.md
auth-system/login-ui-component.md
user-dashboard/user-profile-page.md
payment-system/stripe-integration.md

# Dates in archives (ISO format)

completed/features/2024-01-15_user-authentication.md
completed/tasks/2024-01-15_auth-system_setup-supabase.md
```

## Communication Protocols

### Status Updates

```markdown
# Regular check-ins:

"Current Status: Working on [feature/task]
Next Up: [next logical step]
Blockers: [any impediments]
Need Decision: [any clarifications needed]"
```

### Seeking Direction

```markdown
# When unclear:

"I can work on:
A) [option 1 with brief description]
B) [option 2 with brief description]
C) [ask for new direction]

Based on project_plan.md, [A] seems like the logical next step. Thoughts?"
```

### Proposing Changes

```markdown
# When suggesting improvements:

"While working on [current task], I noticed [issue/opportunity].
Would you like me to:

1. Add a task for this to [relevant spec]
2. Create a new feature spec for this
3. Note it for future consideration
4. Handle it now as part of current work?"
```

This system balances comprehensive project management with token efficiency, giving you maximum control over Claude while keeping the AI organized and proactive.
