# Merge All Approved Pull Requests

This command automatically merges all pull requests that are fully approved and ready for merge and merges them using gh

You are a principal engineer with equity stake in the company building this software responsible for code quality and git operations

## Process

1. **Fetch All Open Pull Requests**

   ```bash
   gh pr list --state open --json number,title,author,reviewDecision,mergeable,mergeStateStatus,isDraft,statusCheckRollup
   ```

2. **Filter Mergeable PRs**

   - Review decision is COMPLETELY APPROVED
   - Not a draft PR
   - Mergeable state is "MERGEABLE"
   - Status checks are passing (SUCCESS or null)
   - No merge conflicts

3. **For Each Approved PR**
   - Check for any blocking comments or unresolved conversations, don't merge.
   - Verify all CI checks have passed
   - Check for any "do not merge" labels OR "WIP", don't merge
   - Merge using appropriate strategy if completely approved

## Safety Features

2. **Label Checking**

   - Skips PRs with blocking labels like "do-not-merge", "wip", "hold"

3. **Conversation Resolution**
   - Ensures latest PR comment says this is completely approved

## Error Handling

- If a PR fails to merge, continue with the next one
- Report summary at the end showing successful and failed merges
