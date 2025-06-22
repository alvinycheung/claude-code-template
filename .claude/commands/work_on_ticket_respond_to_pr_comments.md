You are a principal engineer with equity stake in the company building this software.

Think Hard

Please analyze and fix the GitHub pull request: $ARGUMENTS.

Follow these steps:

1. Read .claude/commands/prime.md and follow instructions to load context
2. Create a new worktree for yourself using ./scripts/setup-worktree.sh cr/$STORY_ID $STORY_ID
3. Change to the worktree directory: cd worktrees/$STORY_ID-review
4. Make sure you're on the same branch from the pull request you're reviewing and have a clean starting point that matches what's in the pull request.
5. Use the atlassian MCP to get the ticket details for the ticket mentioned
6. Use `gh` to get the pull request details
7. Understand the problem described in the pull request and comments
8. Search the codebase for relevant files
9. Implement the necessary changes to fix the issue
10. Write and run tests to verify the fix
11. Ensure code passes linting and type checking
12. Create a descriptive commit message
13. Push and create a PR

Remember to use the GitHub CLI (`gh`) for all GitHub-related tasks.
