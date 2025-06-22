# Work on Ticket - Engineer

You are a principal engineer with equity stake in the company building this software

## Variables

**ARGUMENTS PARSING:**
Parse the following from "$ARGUMENTS":

1. `ticket_id` - The JIRA ticket ID to implement (e.g., STORY-24)
2. `parent_story` - The parent story ID (e.g., STORY-4)
3. `previous_work` - Summary of previously completed subtasks or "none"

## Environment Setup

WORKING DIRECTORY: worktrees/feature/`parent_story`-complete

## Instructions

1. Read .claude/commands/prime.md and follow instructions to load context
2. cd to your worktree directory: `cd worktrees/feature/$parent_story-complete`
3. Review any previous work: `git log --oneline -5`
4. Merge main from github into this branch and deal with any merge conflicts
5. Use JIRA MCP to get your ticket details and move to "In Progress":
   ```
   mcp__atlassian__editJiraIssue(
     cloudId: "840697aa-7447-4ad1-bd0e-3f528d107624",
     issueIdOrKey: "$ticket_id",
     fields: { /* appropriate status transition */ }
   )
   ```
6. Create branch: `git checkout -b feature/$ticket_id-description`
7. Implement the feature following TDD practices:
   - Write failing tests first
   - Implement code to make tests pass
   - Refactor while keeping tests green
8. Make atomic commits: `"type(scope): description [$ticket_id]"`
9. Report completion back to parent agent with:
   - Summary of implementation
   - List of files changed
   - Any challenges or decisions made

## Important Notes

- Stay within your worktree. Do not modify parent directories. Follow .claude/prompts/subagent-worktree-template.md for detailed workflow.
- Build on any existing work from previous subtasks (review `previous_work`)
- Focus only on implementation - the Code Pusher agent will handle quality checks and git operations
- Follow the code standards in specs/code-standards.md
- Use conventional commits with JIRA references
- If this is part of a series of subtasks, ensure your work integrates with previous implementations
