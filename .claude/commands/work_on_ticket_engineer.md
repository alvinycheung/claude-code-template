# Work on JIRA Ticket - Engineer

## Atlassian MCP Configuration

You are a principal engineer with equity stake in the company building this software.

You're working on $ARGUMENTS that you can find information about in JIRA using the atlassian MCP.

This workflow uses the Atlassian MCP integration with the following project-specific configuration:

**Organization**: dotfun.atlassian.net
**Cloud ID**: `840697aa-7447-4ad1-bd0e-3f528d107624`
**Project Key**: `STORY` (Storybooks project)
**Issue Types**: Epic, Story, Task, Bug, Subtask

### Common JIRA Status Transitions

The Storybooks project uses these status transitions:

- **To Do** → **In Progress** (start work)
- **In Progress** → **Code Review** (PR created)
- **Any Status** → **Blocked** (when blocked)

Note: Always fetch available transitions first as IDs may vary.

## Context and Purpose

This workflow ensures consistent, high-quality development by following TDD practices, maintaining code standards, and integrating seamlessly with JIRA project management. Each step builds upon the previous one to create a robust solution.

## Initial Setup and Context Loading

1. Read .claude/commands/prime.md and execute all commands.
1. Stash anything that's in the workspace. Then, pull the latest version of `main` from github
1. **Fetch and Analyze JIRA Ticket**

   Key information to extract:

   - Acceptance criteria from description
   - Related tickets and dependencies
   - Comments for additional context
   - Parent epic/story if this is a subtask
   - Child subtasks if this is a story/epic

   After fetching, reflect on the requirements to ensure full understanding before proceeding.

   IF this ticket has subasks THEN work on each of the subtasks in the most efficient order, sequentially, one subtask at a time.

1. **Update JIRA Status** First get available transitions, then move the ticket to "In Progress" status.

## Related Issues and Dependencies

Before starting development, check for related work:

- Search for related issues in the same epic/story
- Check for blocking/blocked by relationships
- If working on a story with subtasks understand the subtasks as a whole and Think Hard about the most efficient order to iterate through them. Then, iterate through them individually until completion.

## Development Workflow

### Branch Creation and Setup

Create a feature branch following the naming convention that includes both the ticket ID and a descriptive name that is concise yet meaningful, helping team members understand the branch purpose at a glance:

```bash
git checkout -b feature/$ARGUMENTS-descriptive-name
```

### Test-Driven Development Process

1. **Analyze Testing Requirements**
   Based on the ticket requirements, identify:

   - Unit tests needed for business logic
   - Component tests for UI elements
   - Integration tests for API endpoints
   - E2E tests for critical user flows

   Consider edge cases, error scenarios, and performance implications.

2. **Write Failing Tests First**
   Create comprehensive test files before implementation:

   - Name test files with `.test.ts` or `.spec.ts` suffix
   - Group related tests using describe blocks
   - Write descriptive test names that explain expected behavior
   - Include both positive and negative test cases
   - Add performance benchmarks for critical operations

3. **Implement Minimal Solution**
   Write just enough code to make tests pass:

   - Focus on functionality over optimization initially
   - Follow existing code patterns and conventions
   - Use shared packages from the monorepo when applicable
   - Ensure cross-platform compatibility (iOS, Android, Web)

4. **Refactor and Optimize**
   Once tests pass, improve code quality:
   - Extract reusable functions and components
   - Apply SOLID principles
   - Optimize performance bottlenecks
   - Add meaningful error messages
   - Ensure proper TypeScript typing

### Code Quality and Standards

1. **Run Quality Checks**

   Address any issues before proceeding. The code must meet:

   - ESLint standards without errors
   - Full TypeScript type safety
   - Minimum 80% test coverage for new code
   - All existing tests still passing

2. **Security and Child Safety Review**
   Given the application's focus on children:

   - Verify no PII is exposed or logged
   - Check content filtering is applied
   - Ensure API rate limiting is respected
   - Validate input sanitization
   - Review error messages for appropriateness

3. **Performance Considerations**
   Optimize for mobile performance:
   - Minimize re-renders in React components
   - Use lazy loading for heavy assets
   - Implement proper caching strategies
   - Consider offline functionality requirements
   - Monitor API call frequency and costs

### Documentation and Commits

1. **Create Atomic Commits**
2. **Update Documentation**
   Ensure all documentation reflects your changes:
   - Update JSDoc comments for new functions
   - Modify README if setup steps change
   - Add migration notes if breaking changes
   - Update API documentation if applicable

## Deployment Process

### For the ticket or each subtask, Push and Create Pull Request

1. **Push Feature Branch to Github**
2. **Create Comprehensive PR**
   Use GitHub CLI to create a PR with detailed information:

   ```bash
   gh pr create --title "feat: Description [$ticket_id]" --body "$(cat <<'EOF'
   ## Summary
   Brief description of what this PR accomplishes and why it's needed.

   ## Changes
   - Specific change 1
   - Specific change 2
   - Specific change 3

   ## Testing
   - [ ] Unit tests added/updated
   - [ ] E2E tests cover new functionality
   - [ ] Manual testing completed on iOS/Android/Web
   - [ ] Performance impact assessed

   ## JIRA
   [$ARGUMENTS](link-to-jira-ticket)

   ## Screenshots/Videos
   (if applicable for UI changes)
   EOF
   )"
   ```

## **Update JIRA on Completion**

1.  Update the JIRA ticket with the PR link
2.  Move the ticket/subtask status to "Code Review".

## Handling Blockers and Collaboration

If you encounter blockers during development:

    1. Document the blocker in JIRA
    2. Update status to Blocked

## Error Handling and Problem Resolution

When encountering issues during development:

1. **Build or Test Failures**

   - Carefully analyze error messages and stack traces
   - Check for missing dependencies or configuration issues
   - Verify environment variables are properly set
   - Consider clearing caches if dealing with stale data
   - Document solutions in JIRA for future reference

2. **Dependency Conflicts**

   - Review package.json for version mismatches
   - Use yarn's resolution feature for conflicts
   - Test changes across all workspace packages
   - Update lockfile consistently

3. **Performance Issues**

   - Profile the application to identify bottlenecks
   - Use React DevTools for component analysis
   - Monitor API response times
   - Implement caching strategies where appropriate
   - Consider code splitting for large features

4. **Cross-Platform Compatibility**
   - Test on actual devices when possible
   - Use platform-specific code sparingly
   - Leverage Expo's compatibility tools
   - Document any platform-specific behaviors

## Success Criteria

Your implementation is complete when:

- **Code Quality**

  - All tests pass with >80% coverage for new code
  - No ESLint or TypeScript errors
  - Code follows established patterns and conventions
  - Performance benchmarks are met

- **Documentation**

  - Code is self-documenting with clear naming
  - Complex logic includes explanatory comments
  - README updated if setup changes
  - JIRA ticket contains implementation notes

- **Security and Safety**

  - No exposed credentials or PII
  - Input validation implemented
  - Content filtering active for user-generated content
  - Rate limiting respected for API calls

- **Project Management**
  - JIRA ticket moved to "Done"
  - PR approved and merged
  - No merge conflicts with main branch
  - Related documentation updated
