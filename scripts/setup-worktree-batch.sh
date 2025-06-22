#!/bin/bash

# Script to set up multiple git worktrees for parallel development
# Usage: 
#   ./scripts/setup-worktree-batch.sh <story-ids...>
#   ./scripts/setup-worktree-batch.sh <config.json>
# Examples:
#   ./scripts/setup-worktree-batch.sh STORY-4 STORY-5 STORY-6
#   ./scripts/setup-worktree-batch.sh worktree-batch-story-4.json

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Get the root directory
ROOT_DIR=$(git rev-parse --show-toplevel)
SCRIPT_DIR="$ROOT_DIR/scripts"

# Check if any arguments provided
if [ $# -eq 0 ]; then
    echo -e "${RED}Error: At least one story ID or JSON config file required${NC}"
    echo "Usage: $0 <story-ids...> OR $0 <config.json>"
    echo "Examples:"
    echo "  $0 STORY-4 STORY-5 STORY-6"
    echo "  $0 worktree-batch-config.json"
    exit 1
fi

# Check if first argument is a JSON file
if [[ "$1" =~ \.json$ ]] && [ -f "$1" ]; then
    # Parse JSON config file
    CONFIG_FILE="$1"
    echo -e "${BLUE}Reading configuration from $CONFIG_FILE...${NC}"
    
    # Extract subtasks array from JSON using grep and sed (portable solution)
    # This extracts the subtasks and formats them as "ID|NAME|DESCRIPTION"
    SUBTASKS=()
    while IFS= read -r line; do
        SUBTASKS+=("$line")
    done < <(python3 -c "
import json
import sys
with open('$CONFIG_FILE', 'r') as f:
    data = json.load(f)
    for task in data.get('subtasks', []):
        print(f\"{task['id']}|{task['name']}|{task.get('description', '')}\")
" 2>/dev/null || jq -r '.subtasks[] | "\(.id)|\(.name)|\(.description // "")"' "$CONFIG_FILE" 2>/dev/null || echo "")
    
    if [ ${#SUBTASKS[@]} -eq 0 ]; then
        echo -e "${RED}Error: No subtasks found in $CONFIG_FILE${NC}"
        exit 1
    fi
    
    # Convert to story IDs with custom branch names
    STORIES=()
    for SUBTASK in "${SUBTASKS[@]}"; do
        IFS='|' read -r ID NAME DESC <<< "$SUBTASK"
        # Store as "ID:branch-name" format
        STORIES+=("${ID}:feature/${ID}-${NAME}")
    done
else
    # Traditional mode - just story IDs
    STORIES=("$@")
fi

# Function to sanitize branch names
sanitize_branch_name() {
    local story_id=$1
    # Convert to lowercase and replace spaces/special chars with hyphens
    echo "$story_id" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9-]/-/g'
}

# Summary tracking
TOTAL_STORIES=${#STORIES[@]}
SUCCESSFUL=0
FAILED=0
CREATED_WORKTREES=()

echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${CYAN}Setting up worktrees for $TOTAL_STORIES subtasks${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo

# Process each story
for STORY_ENTRY in "${STORIES[@]}"; do
    # Check if entry contains custom branch name (ID:branch format)
    if [[ "$STORY_ENTRY" == *":"* ]]; then
        IFS=':' read -r STORY_ID BRANCH_NAME <<< "$STORY_ENTRY"
    else
        # Traditional mode - auto-generate branch name
        STORY_ID="$STORY_ENTRY"
        SANITIZED=$(sanitize_branch_name "$STORY_ID")
        BRANCH_NAME="feature/${SANITIZED}"
    fi
    
    echo -e "${BLUE}Processing $STORY_ID with branch $BRANCH_NAME...${NC}"
    
    # Call the individual setup script
    if "$SCRIPT_DIR/setup-worktree.sh" "$BRANCH_NAME" "$STORY_ID"; then
        SUCCESSFUL=$((SUCCESSFUL + 1))
        WORKTREE_DIR_NAME=$(echo "$BRANCH_NAME" | sed 's|^feature/||')
        CREATED_WORKTREES+=("worktrees/$WORKTREE_DIR_NAME")
        echo -e "${GREEN}✓ Successfully created worktree for $STORY_ID${NC}"
    else
        FAILED=$((FAILED + 1))
        echo -e "${RED}✗ Failed to create worktree for $STORY_ID${NC}"
    fi
    
    echo
done

# Print summary
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${CYAN}Summary:${NC}"
echo -e "  ${GREEN}Successful:${NC} $SUCCESSFUL"
echo -e "  ${RED}Failed:${NC} $FAILED"
echo -e "  ${BLUE}Total:${NC} $TOTAL_STORIES"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

if [ ${#CREATED_WORKTREES[@]} -gt 0 ]; then
    echo
    echo -e "${YELLOW}Created worktrees:${NC}"
    for WORKTREE in "${CREATED_WORKTREES[@]}"; do
        echo "  - $WORKTREE"
    done
    echo
    echo -e "${YELLOW}To spawn agents for these worktrees, use the prompts in:${NC}"
    echo "  $ROOT_DIR/.claude/prompts/subagent-worktree-template.md"
fi

exit $FAILED