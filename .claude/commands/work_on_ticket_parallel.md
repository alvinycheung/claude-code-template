# Work on tickets in parallel

Work on the $ARGUMENTS ticket from the JIRA board.

## Pre-flight Checks

1. **Load project context**: Read .claude/commands/prime.md and follow instructions to load context
2. **Fetch JIRA details**: Get the Epic/Story details for $ARGUMENTS
3. **Analyze scope**: Count subtasks/child issues
4. **Prepare worktrees**: Set up isolated environments for parallel work

## Parallel Agent Coordination

### Distribution Strategy

Based on subtask count:

- **1-5 subtasks**: Launch all agents simultaneously
- **>6 subtasks**: Launch in batches of 3-5 agents, monitor progress

### Worktree Setup Process

For each subtask in $ARGUMENTS:

1. **Create worktree** (two options):

   **Option A - Using JSON configuration (recommended for many subtasks):**

   ```json
   {
     "parent_story": "STORY-X",
     "subtasks": [
       {
         "id": "STORY-XX",
         "name": "descriptive-name",
         "description": "What this subtask does"
       }
     ]
   }
   ```

   Then run:

   ```bash
   ./scripts/setup-worktree-batch.sh config.json
   ```

   **Option B - Direct command for individual subtasks:**

   ```bash
   ./scripts/setup-worktree.sh feature/[SUBTASK-ID]-description [SUBTASK-ID]
   # Or for multiple:
   ./scripts/setup-worktree-batch.sh STORY-20 STORY-21 STORY-22
   ```

2. **Spawn subagent with instructions**:

   ```
   You are a development subagent working on [SUBTASK-ID] in an isolated git worktree.

   Behave and write code like a Principal Engineer who has equity stake in the company that owns the product.

   WORKING DIRECTORY: worktrees/feature/[SUBTASK-ID]-description
   JIRA TICKET: [SUBTASK-ID]
   PARENT EPIC/STORY: $ARGUMENTS

   Instructions:
   1. Read .claude/commands/prime.md and follow instructions to load context
   2. cd to your worktree directory
   3. Verify clean branch with git status
   4. Use JIRA MCP to get your ticket details and move to "In Progress"
   5. Implement the feature following TDD practices
   6. Make atomic commits: "type(scope): description [SUBTASK-ID]"
   7. Run quality checks: yarn lint:fix && yarn typecheck && yarn test
   8. Push branch: git push -u origin feature/[SUBTASK-ID]-description
   9. Create PR when complete
   10. Update JIRA to "Code Review" status

   IMPORTANT: Stay within your worktree. Do not modify parent directories.
   Follow .claude/prompts/subagent-worktree-template.md for detailed workflow.
   ```

## Parent Agent Responsibilities

### Monitor Progress

1. **Track JIRA board**: Watch for status changes
2. **Review PRs**: As subagents create PRs, review and coordinate
3. **Handle blockers**: If subagents report blockers, intervene
4. **Manage dependencies**: Coordinate work between related subtasks

### Coordination Commands

```bash
# List all active worktrees
git worktree list

# Check subagent progress
./scripts/cleanup-worktrees.sh

# Clean up completed work
./scripts/cleanup-worktrees.sh --merged
```

### Completion Workflow

When all subtasks are complete:

1. **Verify all PRs merged**
2. **Update parent Epic/Story status in JIRA**
3. **Clean up all worktrees**:
   ```bash
   ./scripts/cleanup-worktrees.sh --all
   ```
4. **Update project_plan.md** with completion status
5. **Prepare summary** of work completed

## Error Handling

If subagents encounter issues:

1. **Blocker Protocol**:

   - Subagent documents blocker in JIRA
   - Parent agent receives notification
   - Assess if other agents can continue
   - Intervene or reassign as needed

2. **Merge Conflicts**:

   - Coordinate between affected subagents
   - Resolve in order of dependency
   - Update affected worktrees

3. **Failed Tests**:
   - Subagent must fix before proceeding
   - If blocked, escalate to parent
   - Consider pairing agents on complex issues

## Success Criteria

- All subtasks moved to "Done" in JIRA
- All PRs reviewed and merged
- All tests passing in main branch
- Documentation updated
- No orphaned worktrees
- Parent Epic/Story updated with summary

## Example Usage

```
/work_on_story STORY-1

This will:
1. Fetch STORY-1 details from JIRA
2. Identify all subtasks (e.g., STORY-4, STORY-5, STORY-6)
3. Create worktrees for each subtask
4. Spawn parallel agents to work on each
5. Monitor and coordinate their progress
6. Clean up when complete
```
