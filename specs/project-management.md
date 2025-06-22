# AI-Assisted Project Management with JIRA MCP

## Overview

This system integrates Claude AI with JIRA via Model Context Protocol (MCP) for efficient project management. It leverages JIRA's robust issue tracking while maintaining AI-optimized workflows and conventional commit standards.

### Project Configuration

- **JIRA Project**: Storybooks (Key: STORY)
- **Confluence Space**: Storybooks (Key: ST)
- **Cloud ID**: 840697aa-7447-4ad1-bd0e-3f528d107624
- **Site URL**: https://dotfun.atlassian.net

## Core Philosophy

- **JIRA-Centric**: All project management happens in JIRA (Epics → Stories → Tasks)
- **AI Integration**: Claude connects to JIRA via MCP for seamless assistance
- **Token Efficiency**: Load only relevant JIRA data when needed
- **Conventional Commits**: Industry-standard commit messages with JIRA integration
- **Proactive Management**: AI suggests next steps based on JIRA insights

## Claude's Core Responsibilities

### Session Start Protocol

1. **Load** `specs/project_plan.md` (master context)
2. **Connect** to JIRA via MCP for Storybooks project (STORY)
3. **Review** active sprint and in-progress issues
4. **Identify** next logical task based on priorities
5. **Surface** any blockers or dependencies

### Daily Workflow

1. **Query JIRA** for assigned/active issues
2. **Load specific** issue details when working
3. **Update JIRA** status and add implementation comments
4. **Maintain docs** (README.md, project_plan.md as needed)
5. **Commit work** using conventional commits with JIRA references

## JIRA Integration

### Issue Types & Usage

- **Epic** (ID: 10142): Major feature initiatives
- **Story** (ID: 10141): Feature specifications with acceptance criteria
- **Task** (ID: 10139): Implementation work
- **Subtask** (ID: 10143): Granular development tasks
- **Bug** (ID: 10140): Defect tracking and resolution

### Status Workflow

**Backlog** → **Move to Current Sprint & automatically To Do** → **In Progress** → **Code Review** → **Testing** → **Done**

### MCP Integration Notes

**Important**: When using JIRA MCP tools, always use the cloud ID, not the site URL: cloudId: "840697aa-7447-4ad1-bd0e-3f528d107624"

Transition IDs vary by project configuration - query available transitions dynamically rather than hardcoding.

### Token Optimization

- **Always load**: `project_plan.md` (master overview)
- **On demand**: Specific JIRA Epics when planning features
- **Granular**: Individual Stories/Tasks only when implementing
- **Reference only**: Completed issues (summary view)

## Key Workflows

### Starting New Feature

```markdown
1. USER: "Let's add user authentication"
2. CLAUDE: "I'll create a JIRA Epic and stories for this."
3. Create JIRA Epic: [STORY-100] User Authentication System
4. Create Stories: [STORY-101] Basic Login, [STORY-102] OAuth
5. Update project_plan.md with Epic reference
6. Commit: "feat: add authentication system to project plan"
   Body: "References: STORY-100, STORY-101, STORY-102"
```

### Working on Issues

```markdown
1. Update JIRA status: Backlog → In Progress
2. Add comments for decisions/blockers
3. Update time tracking and story points
4. Link related issues for dependencies
5. Maintain documentation as needed
6. Commit: "feat(auth): implement login validation"
   Body: "References: STORY-101"
```

### Completing Work

```markdown
1. Mark JIRA issue as Done with completion comments
2. Update related Epic/Story progress
3. Close dependent sub-tasks
4. Update project milestones in project_plan.md
5. Commit: "feat: complete authentication system"
   Body: "Closes: STORY-100, STORY-101, STORY-102"
6. Push to GitHub: `git push origin feature/auth-system`
7. Create PR: `gh pr create --title "feat: Authentication System [STORY-100]" --body "## Summary\n- Implements login/logout\n- OAuth integration\n\nCloses: STORY-100, STORY-101, STORY-102"`
```

### Pull Request Workflow

```markdown
1. Always work on feature branches: `git checkout -b feature/[JIRA-ID]-description`
2. Push changes regularly: `git push -u origin feature/[JIRA-ID]-description`
3. When feature is complete and tested:
   - Ensure all tests pass
   - Update documentation
   - Create PR with: `gh pr create`
   - Title format: "type: Description [JIRA-ID]"
   - Body should include:
     - Summary of changes
     - JIRA references (Closes: STORY-XXX)
     - Testing performed
     - Any breaking changes
4. Link PR to JIRA issue for visibility
```

## Best Practices

### Issue Management

- **Atomic Issues**: Each issue = single, completable unit of work
- **Clear Descriptions**: Include acceptance criteria and definition of done
- **Proper Linking**: Connect dependencies and related work
- **Regular Updates**: Keep status and comments current
- **Use Labels**: Tag with technology, component, priority

### Documentation Maintenance

- Update README.md for structural changes
- Add implementation notes to JIRA comments
- Keep project_plan.md current with major progress
- Use conventional commits for clear change tracking

### Communication

```markdown
# Status Updates

"Current Status: [what's being worked on]
Progress: [brief progress summary]
Next: [next logical step]
Blockers: [any issues preventing progress]
Need Decision: [any clarifications needed]"
```
