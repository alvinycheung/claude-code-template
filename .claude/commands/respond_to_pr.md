Please analyze and fix the GitHub pull request: $ARGUMENTS.

Follow these steps:

1. Read .claude/commands/prime.md and follow instructions to load context
2. Make sure you're on the same branch from the pull request you're reviewing and have a clean starting point that matches what's in the pull request.
3. Use the atlassian MCP to get the ticket details for the ticket mentioned
4. Use `gh` to get the pull request details
5. Understand the problem described in the pull request and comments
6. Search the codebase for relevant files
7. Implement the necessary changes to fix the issue
8. Write and run tests to verify the fix
9. Ensure code passes linting and type checking
10. Create a descriptive commit message
11. Push and create a PR

Remember to use the GitHub CLI (`gh`) for all GitHub-related tasks.
