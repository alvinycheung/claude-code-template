# Work on Ticket

Think Hard

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

Execute work units with sequential Sub Agent flow:

1. Define work unit execution sequence:

   - Step 1: Spawn three Sub Agents in parallel and tell me what you say to each of them:
     - Engineer Sub Agent performs the implementation
     - Code Review Sub Agent responds to any code reviews that need work
     - Code Merging Engineer Sub Agent merges any pull requests that are completely approved
   - Step 2: Spawn three Sub Agents in parallel and tell me what you say to each of them:
     - Support Engineer Sub Agent reviews and assists with fixes
     - Code Review Sub Agent
     - Code Merging Engineer Sub Agent
   - Step 3: Spawn three Sub Agents in parallel and tell me what you say to each of them:
     - Project Manager Sub Agent verifies completion and updates
       tracking
     - Code Review Sub Agent
     - Code Merging Engineer Sub Agent

2. Determine execution flow:

   - Check if $ARGUMENTS has subtasks in JIRA
   - If NO subtasks exist:
     - Execute work unit sequence for $ARGUMENTS directly
   - If subtasks exist:
     - Order subtasks by dependencies and logical sequence
     - Execute work unit sequence for each subtask in order

3. Execution pattern:
   function execute_work_unit(ticket_id): 1. Run Engineer Sub Agent(ticket_id) 2. Run Support Engineer Sub Agent(ticket_id) 3. Run Project Manager Sub Agent(ticket_id)

   if ticket has no subtasks:
   execute_work_unit($ARGUMENTS)
     else:
         ordered_subtasks = order_by_dependencies(get_subtasks($ARGUMENTS))
   for each subtask in ordered_subtasks:
   execute_work_unit(subtask.id)

### Setup

Before creating Sub Agents, create a worktree:

```bash
./scripts/setup-worktree.sh feature/$ARGUMENTS-complete $ARGUMENTS
```

## Sequential Flow Control

After verification:

1. Document cumulative progress
2. Identify next subtask in optimal order
3. Launch next development Sub Agent with context of completed work
4. Repeat until all subtasks complete

## Completion

When all work is done:

1. Verify all PRs created
2. Update parent $ARGUMENTS in JIRA
3. Update subtasks of $ARGUMENTS in JIRA
4. Provide summary of all completed work

## Sub Agent Instructions

### Engineer Sub Agent Instructions

```
WORKING DIRECTORY: worktrees/feature/$ARGUMENTS-complete
JIRA TICKET: [TICKET-ID]
PARENT STORY: $ARGUMENTS
PREVIOUS WORK: [List completed subtasks if any]
Read .claude/commands/work_on_ticket_engineer.md and follow all instructions
```

### Project Manager Sub Agent Instructions

```
WORKING DIRECTORY: worktrees/feature/$ARGUMENTS-complete
JIRA TICKET: [TICKET-ID]
PARENT STORY: $ARGUMENTS
PREVIOUS WORK: [List completed subtasks if any]
Read .claude/commands/work_on_ticket_project_manager.md and follow all instructions
```

### Support Engineer Sub Agent Instructions

```
WORKING DIRECTORY: worktrees/feature/$ARGUMENTS-complete
JIRA TICKET: [TICKET-ID]
PARENT STORY: $ARGUMENTS
PREVIOUS WORK: [List completed subtasks if any]

Read .claude/commands/work_on_ticket_support_engineer.md and follow all instructions
```

### Code Review Engineer Sub Agent Instructions

```
JIRA TICKET: [TICKET-ID]
PARENT STORY: $ARGUMENTS
PREVIOUS WORK: [List completed subtasks if any]
Read .claude/commands/respond_to_all_code_reviews.md and follow all instructions
```

### Code Merging Engineer Sub Agent Instructions

```
JIRA TICKET: [TICKET-ID]
PARENT STORY: $ARGUMENTS
PREVIOUS WORK: [List completed subtasks if any]
Read .claude/commands/merge_all_approved_pull_requests.md and follow all instructions
```
