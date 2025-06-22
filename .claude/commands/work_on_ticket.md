# Work on Ticket

You're a principal CTO with equity stake in the company building this software

## Your Responsibilities

## 1. Initial Analysis

1. Fetch $ARGUMENTS details from JIRA using Atlassian MCP
2. Check for subtasks in "to do" from the fetched data
3. IF has subtasks: Analyze dependencies and determine optimal execution order.
   Order subtasks by:
   1. Explicit JIRA dependencies/blockers
   2. Logical dependencies (config → implementation → testing)
   3. Foundation first (Jest before RNTL, RNTL before Detox)

## 2. Execution Strategy

Execute work units with sequential subagent flow:

1. Define work unit execution sequence:

   - Step 1: Spawn three subagents in parallel:
     - Engineer Subagent performs the implementation
     - Code Review Subagent responds to any code reviews that need work
     - Code Merging Engineer Subagent merges any pull requrests that are completely approved
   - Step 2: Spawn three subagents in parallel:
     - Support Engineer Subagent reviews and assists with fixes
     - Code Review Subagent
     - Code Merging Engineer Subagent
   - Step 3: Spawn three subagents in parallel:
     - Project Manager Subagent verifies completion and updates
       tracking
     - Code Review Subagent
     - Code Merging Engineer Subagent

2. Determine execution flow:

   - Check if $ARGUMENTS has subtasks in JIRA
   - If NO subtasks exist:
     - Execute work unit sequence for $ARGUMENTS directly
   - If subtasks exist:
     - Order subtasks by dependencies and logical sequence
     - Execute work unit sequence for each subtask in order

3. Execution pattern:
   function execute_work_unit(ticket_id): 1. Run Engineer subagent(ticket_id) 2. Run Support Engineer subagent(ticket_id) 3. Run Project Manager subagent(ticket_id)

   if ticket has no subtasks:
   execute_work_unit($ARGUMENTS)
     else:
         ordered_subtasks = order_by_dependencies(get_subtasks($ARGUMENTS))
   for each subtask in ordered_subtasks:
   execute_work_unit(subtask.id)

### Setup

Before creating subagents, create a worktree:

```bash
./scripts/setup-worktree.sh feature/$ARGUMENTS-complete $ARGUMENTS
```

## Sequential Flow Control

After verification:

1. Document cumulative progress
2. Identify next subtask in optimal order
3. Launch next development subagent with context of completed work
4. Repeat until all subtasks complete

## Completion

When all work is done:

1. Verify all PRs created
2. Update parent $ARGUMENTS in JIRA
3. Update subtasks of $ARGUMENTS in JIRA
4. Provide summary of all completed work

## Subagent Instructions

### Engineer Subagent Instructions

```
WORKING DIRECTORY: worktrees/feature/$ARGUMENTS-complete
JIRA TICKET: [TICKET-ID]
PARENT STORY: $ARGUMENTS
PREVIOUS WORK: [List completed subtasks if any]

Instructions:
1. Read .claude/commands/prime.md and follow instructions to load context
2. Read .claude/commands/work_on_ticket_engineer.md and follow all instructions
```

### Project Manager Subagent Instructions

```
WORKING DIRECTORY: worktrees/feature/$ARGUMENTS-complete
JIRA TICKET: [TICKET-ID]
PARENT STORY: $ARGUMENTS
PREVIOUS WORK: [List completed subtasks if any]

Instructions:
1. Read .claude/commands/prime.md and follow instructions to load context
2. Read .claude/commands/work_on_ticket_project_manager.md and follow all instructions
```

### Support Engineer Subagent Instructions

```
WORKING DIRECTORY: worktrees/feature/$ARGUMENTS-complete
JIRA TICKET: [TICKET-ID]
PARENT STORY: $ARGUMENTS
PREVIOUS WORK: [List completed subtasks if any]

Instructions:
1. Read .claude/commands/prime.md and follow instructions to load context
2. Read .claude/commands/work_on_ticket_support_engineer.md and follow all instructions
```

### Code Review Engineer Subagent Instructions

```
JIRA TICKET: [TICKET-ID]
PARENT STORY: $ARGUMENTS
PREVIOUS WORK: [List completed subtasks if any]
Instructions:
1. Read .claude/commands/prime.md and follow instructions to load context
2. Read .claude/commands/respond_to_all_code_reviews.md and follow all instructions
```

### Code Merging Engineer Subagent Instructions

```
JIRA TICKET: [TICKET-ID]
PARENT STORY: $ARGUMENTS
PREVIOUS WORK: [List completed subtasks if any]
Instructions:
1. Read .claude/commands/prime.md and follow instructions to load context
2. Read .claude/commands/merge_all_approved_pull_requests.md and follow all instructions
```
