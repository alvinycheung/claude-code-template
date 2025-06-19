# AI-Assisted Hierarchical Project Management

## Overview

This document outlines how I (Claude) should manage your project using a hierarchical planning system. The goal is to keep track of all your requests, maintain organized planning across multiple levels, and ensure nothing gets forgotten while working efficiently.

## Planning Hierarchy Structure

```
/specs/
├── project_plan.md           # Main high-level project plan (ALWAYS START HERE)
├── [feature-name]-plan.md    # Detailed feature/component plans
├── [feature-name]-[component]-plan.md  # Sub-detail plans (up to 3 levels)
└── completed/                # Completed plans (archived but referenceable)
    ├── [old-plan].md
    └── [another-old-plan].md
```

## My Core Responsibilities

### 1. Project Plan Management

**Always Start with `/specs/project_plan.md`:**

- This is my entry point when you ask "What should we work on next?"
- It provides the high-level overview and links to active detail plans
- I should update this whenever we complete major milestones or change direction

**Hierarchical Planning:**

- **Level 1:** Main project plan - high-level phases and coordination
- **Level 2:** Detail plans - specific features, components, or work streams
- **Level 3:** Sub-detail plans - granular task breakdowns when needed

### 2. Request Tracking & Task Management

**When you give me a new request:**

1. **Immediate Assessment:** Determine if this fits existing plans or needs new planning
2. **Plan Selection:** Choose the appropriate level (main, detail, sub-detail)
3. **Task Creation:** Add to relevant plan with clear description and status
4. **Dependency Check:** Identify prerequisites and blockers
5. **Update Parent Plans:** Ensure higher-level plans reflect the new work

**Task Status Tracking:**

- `[ ]` - Not started
- `[~]` - In progress / blocked (with reason)
- `[x]` - Completed
- `[>]` - Moved to another plan or deferred

### 3. Active Work Session Management

**During Our Work:**

- Keep track of what we're actively working on
- Note any discoveries or changes that affect the plan
- Identify new tasks that emerge during implementation
- Ask for clarification when requirements are ambiguous

**Context Switching:**

- When switching between different areas of work
- Update current task status before moving on
- Ensure I understand which plan/task we're now focusing on

### 4. Plan Lifecycle Management

**Creating New Detail Plans:**

```markdown
# [Feature Name] - Detail Plan

**Parent Plan:** /specs/project_plan.md
**Status:** Active/Blocked/Complete
**Created:** YYYY-MM-DD
**Last Updated:** YYYY-MM-DD

## Objective

[Clear description of what this plan accomplishes]

## Tasks

- [ ] Task 1
- [ ] Task 2
  - [ ] Sub-task 2.1
  - [ ] Sub-task 2.2

## Dependencies

- Requires: [Other plans or external dependencies]
- Blocks: [What this plan blocks]

## Implementation Notes

[Technical decisions, approaches, gotchas]

## Completion Criteria

[How we know this is done]
```

**Moving Completed Plans:**

- When a detail plan is 100% complete, move it to `/specs/completed/`
- Update parent plan to reflect completion
- Ensure any references in other plans are updated

### 5. Git Commit Workflow

**Plan Updates:**

- `docs(plan): [description of plan changes]`
- Commit immediately after updating plan status
- Include brief context about what triggered the update

**Work Completion:**

```bash
# Update the plan first
git add specs/[relevant-plan].md
git commit -m "docs(plan): Mark '[task name]' as complete"

# Then commit the actual work (if applicable)
git add [modified files]
git commit -m "feat/fix/etc: [description of work done]"
```

## Communication Protocols

### Starting a Session

1. **Check Main Plan:** Review `/specs/project_plan.md` for context
2. **Identify Active Work:** Find what we were last working on
3. **Confirm Direction:** Ask what you want to focus on if unclear

### During Work

- **Progress Updates:** "I've completed [task], updating the plan now"
- **New Discovery:** "I found we also need [new task], should I add this to [plan]?"
- **Blockers:** "This task is blocked by [reason], moving to next available task"
- **Context Questions:** "Should this be part of the current plan or need a new detail plan?"

### Ending a Session

- **Status Summary:** Brief recap of what we accomplished
- **Plan Updates:** Confirm all changes are reflected in appropriate plans
- **Next Session Prep:** Clear indication of what's next

## AI Best Practices

### Request Handling

- **Clarify First:** If a request is ambiguous, ask questions before planning
- **Right-Size Plans:** Don't create overly detailed plans for simple tasks
- **Stay Organized:** Keep related tasks in the same plan when logical

### Memory & Context

- **Read Plans Fresh:** Don't assume I remember details from past sessions
- **Document Decisions:** Capture important technical or design decisions in plans
- **Link Related Work:** Reference other plans when tasks are connected

### Efficiency

- **Batch Similar Work:** Group related tasks when possible
- **Minimize Context Switching:** Finish logical chunks before moving between plans
- **Keep Main Plan Current:** Regular updates to high-level status

## Example Interaction Flows

### New Feature Request

**You:** "I need to add user authentication to the app"

**Me:**

1. Check if this fits existing plans or needs a new detail plan
2. "This looks like a significant feature. Should I create `/specs/user-auth-plan.md` for detailed planning?"
3. Create detail plan with tasks, dependencies, and technical approach
4. Update main project plan to reference the new detail plan
5. Ask which specific auth task you want to start with

### Status Check Request

**You:** "What should we work on next?"

**Me:**

1. Read `/specs/project_plan.md` first
2. Check active detail plans for next uncompleted task
3. "Based on the main plan, we're in [phase]. The next task is [task] from [detail-plan]. Should we continue with this or would you prefer to work on something else?"

This system ensures I can effectively track your requests, maintain organized planning, and help you stay focused on completing tasks without forgetting important details along the way.
