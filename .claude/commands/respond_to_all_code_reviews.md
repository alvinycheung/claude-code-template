# Respond to ALL Code Reviews Command

Starts continuous monitoring (every 5 minutes) for PRs needing work and automatically spawns agents to address feedback.

RUN:

- `/prime` to load project context

THEN:

### 1. PR Discovery & Analysis

```bash
# Find all open PRs with review status
gh pr list --json number,title,headRefName,reviewDecision,statusCheckRollup,isDraft

# For each PR, analyze review comments
gh pr view PR_NUMBER --comments
```

The parent agent uses Claude's understanding to categorize PRs:

- **CRITICAL**: Formal "CHANGES_REQUESTED", failing CI, or "APPROVE WITH MINOR FIXES" with specific bugs
- **HIGH**: Specific code changes requested, unchecked tasks, performance concerns
- **LOW**: Optional improvements, style suggestions
- **SKIP**: Clean approvals, drafts, or "ready to merge"

### 2. Continuous Monitoring Loop

```yaml
monitor_state:
  check_interval: 5_minutes
  actions:
    - Detect new reviews on existing PRs
    - Find newly opened PRs with reviews
    - Compare against processed_prs list
    - Spawn agents for new work

  periodic_tasks:
    30_minutes: Status update
    2_hours: Clean merged PR worktrees
    6_hours: Full state refresh
```

### 3. Agent Spawning

#### Agent Coordination Strategy

- **1-5 PRs**: Launch all agents simultaneously
- **6+ PRs**: Launch in waves of 3-5, prioritizing critical PRs
- **Resource limit**: Max 5 concurrent agents
- **State tracking**: Maintain list of processed PRs and active agents

For each PR requiring work:

```bash
# Ensure worktree exists
BRANCH_NAME=$(gh pr view PR_NUMBER --json headRefName -q .headRefName)
STORY_ID=$(echo "$BRANCH_NAME" | grep -oE 'STORY-[0-9]+' || echo "STORY-XX")
WORKTREE_PATH="worktrees/${STORY_ID}-review"

if [ ! -d "$WORKTREE_PATH" ]; then
  ./scripts/setup-worktree.sh "cr/${STORY_ID}" "${STORY_ID}"
fi
```

Spawn agent with instructions:

```
You are a Principal Engineer with stake in the company building this product and you are addressing code review feedback on PR #[PR_NUMBER].

WORKING DIRECTORY: worktrees/[STORY_ID]-review
PRIORITY: [CRITICAL/HIGH/LOW]
REVIEW SUMMARY: [What needs addressing]

Tasks:
1. Read .claude/commands/prime.md and follow instructions to load context
2. Create worktree if needed: ./scripts/setup-worktree.sh cr/[STORY_ID] [STORY_ID]
3. cd worktrees/[STORY_ID]-review
4. Pull latest: git pull origin [BRANCH_NAME]
5. Analyze review: gh pr view [PR_NUMBER] --comments
6. Fix issues in priority order:
   - Bugs/errors first
   - Clear improvements second
   - Optional suggestions last
7. Run quality checks: yarn lint:fix && yarn typecheck && yarn test
8. Commit with descriptive messages
9. Push: git push origin [BRANCH_NAME]
10. Reply to review comments explaining changes
11. Re-request review when done

Remember: Use engineering judgment. Document reasoning if you disagree with feedback.
```

## Success Criteria

- All critical/high priority feedback addressed
- CI checks passing
- Review re-requested from original reviewers
- Clear responses to all review comments

## Example Review Analysis

```
PR #22: "APPROVE WITH MINOR FIXES - Fix Button size logic"
→ Category: CRITICAL (specific bugs identified)
→ Action: Spawn agent immediately

PR #19: "approved with minor improvements"
→ Category: LOW (optional)
→ Action: Skip unless requested

PR #20: "ready to merge"
→ Category: SKIP
→ Action: No work needed
```

## Status Updates

Every 30 minutes:

```
Active: 3 agents (PRs #22, #24, #27)
Completed: 2 PRs addressed (#21, #23)
Queued: 1 PR waiting (#28)
Next check: 10:35 AM
```

## Tips for Effective Agents

- Make atomic commits for each piece of feedback
- Link commits when replying to review comments
- Ask for clarification on unclear feedback
- Prioritize fixes over enhancements
- Document disagreements professionally
