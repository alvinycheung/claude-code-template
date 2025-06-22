#!/bin/bash

# Script to set up a git worktree for parallel development
# Usage: ./scripts/setup-worktree.sh <branch-name> [story-id]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the root directory of the main git repo
ROOT_DIR=$(git rev-parse --show-toplevel)

# Check if branch name is provided
if [ -z "$1" ]; then
    echo -e "${RED}Error: Branch name required${NC}"
    echo "Usage: $0 <branch-name> [story-id] [worktree-name]"
    echo "       $0 <branch-name> [worktree-name]"
    echo "Examples:"
    echo "  $0 feature/STORY-4-testing STORY-4"
    echo "  $0 cr/STORY-4 STORY-4"
    echo "  $0 feature/auth-improvements auth-review"
    exit 1
fi

BRANCH_NAME=$1

# Smart parameter detection
if [ -n "$2" ]; then
    if [[ "$2" =~ ^STORY- ]]; then
        # If second param starts with STORY-, it's a story ID
        STORY_ID=$2
        CUSTOM_WORKTREE_NAME=${3:-""}
    else
        # Otherwise, it's a custom worktree name
        STORY_ID=""
        CUSTOM_WORKTREE_NAME=$2
    fi
else
    STORY_ID=""
    CUSTOM_WORKTREE_NAME=""
fi

# Determine worktree directory name
if [ -n "$CUSTOM_WORKTREE_NAME" ]; then
    # Use custom name if provided
    WORKTREE_DIR_NAME="$CUSTOM_WORKTREE_NAME"
else
    # Sanitize branch name for directory
    if [[ "$BRANCH_NAME" =~ ^(cr|review)/ ]]; then
        # For code review branches, remove prefix and add -review suffix
        WORKTREE_DIR_NAME=$(echo "$BRANCH_NAME" | sed 's|^[^/]*/||')-review
    else
        # For feature branches, just remove the prefix
        WORKTREE_DIR_NAME=$(echo "$BRANCH_NAME" | sed 's|^feature/||')
    fi
fi

WORKTREE_DIR="worktrees/$WORKTREE_DIR_NAME"

# Create worktrees directory if it doesn't exist
mkdir -p worktrees

# Check if worktree already exists
if [ -d "$WORKTREE_DIR" ]; then
    echo -e "${YELLOW}Worktree already exists at $WORKTREE_DIR${NC}"
    exit 1
fi

# Check if branch already exists
if git show-ref --verify --quiet refs/heads/"$BRANCH_NAME"; then
    echo -e "${YELLOW}Branch $BRANCH_NAME already exists locally${NC}"
    echo -e "${YELLOW}Using existing branch for worktree${NC}"
    git worktree add "$WORKTREE_DIR" "$BRANCH_NAME"
elif git ls-remote --heads origin "$BRANCH_NAME" | grep -q "$BRANCH_NAME"; then
    echo -e "${YELLOW}Branch $BRANCH_NAME exists on remote${NC}"
    echo -e "${YELLOW}Creating worktree from remote branch${NC}"
    git worktree add "$WORKTREE_DIR" -b "$BRANCH_NAME" "origin/$BRANCH_NAME"
else
    echo -e "${GREEN}Creating new branch $BRANCH_NAME from origin/main...${NC}"
    # Fetch latest from origin
    git fetch origin main
    git worktree add -b "$BRANCH_NAME" "$WORKTREE_DIR" origin/main
fi

# Copy necessary environment files
if [ -f .env ]; then
    cp .env "$WORKTREE_DIR/.env"
fi

if [ -f .env.local ]; then
    cp .env.local "$WORKTREE_DIR/.env.local"
fi

# Copy MCP configuration if it exists
if [ -f .mcp.json ]; then
    cp .mcp.json "$WORKTREE_DIR/.mcp.json"
fi

# Copy Claude configuration if it exists
if [ -d .claude ]; then
    cp -r .claude "$WORKTREE_DIR/.claude"
fi

# Install dependencies in the worktree
echo -e "${GREEN}Installing dependencies...${NC}"
cd "$WORKTREE_DIR"

# Use yarn install with frozen lockfile to ensure consistency
yarn install --frozen-lockfile

# Return to root directory
cd "$ROOT_DIR"

# Determine if this is a code review branch
IS_REVIEW_BRANCH=false
if [[ "$BRANCH_NAME" =~ ^(cr|review)/ ]] || [[ "$WORKTREE_DIR_NAME" =~ -review$ ]]; then
    IS_REVIEW_BRANCH=true
fi

# Create a README for the worktree
cat > "$WORKTREE_DIR/WORKTREE_README.md" << EOF
# Worktree: $BRANCH_NAME

This is a git worktree for branch: $BRANCH_NAME
${STORY_ID:+JIRA Story: $STORY_ID}
${IS_REVIEW_BRANCH:+Purpose: Code Review}

## Important Notes

- This is an isolated working directory
- Changes here won't affect the main repository
- Use standard git commands within this directory
- When done, use: git worktree remove ../$WORKTREE_DIR

## Commands

\`\`\`bash
# Make changes and commit
git add .
git commit -m "${IS_REVIEW_BRANCH:+fix: address review feedback}${IS_REVIEW_BRANCH:- feat: your message} ${STORY_ID:+[$STORY_ID]}"
git push -u origin $BRANCH_NAME

# Create PR when ready${IS_REVIEW_BRANCH:+ (or update existing PR)}
gh pr create --title "${IS_REVIEW_BRANCH:+fix: address review feedback}${IS_REVIEW_BRANCH:- feat: Description} ${STORY_ID:+[$STORY_ID]}"

# Clean up when done
cd ../..
git worktree remove $WORKTREE_DIR
\`\`\`

${IS_REVIEW_BRANCH:+## Code Review Workflow

1. Pull latest changes from the branch being reviewed
2. Address feedback and make necessary changes
3. Commit with descriptive messages about what was addressed
4. Push changes and update the PR
}
EOF

echo -e "${GREEN}✓ Worktree created successfully at: $WORKTREE_DIR${NC}"
echo -e "${GREEN}✓ Dependencies installed${NC}"
echo -e "${GREEN}✓ Environment files copied${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}Worktree Details:${NC}"
echo -e "  ${BLUE}Directory:${NC} $WORKTREE_DIR"
echo -e "  ${BLUE}Branch:${NC} $BRANCH_NAME"
echo -e "  ${BLUE}Type:${NC} ${IS_REVIEW_BRANCH:+Code Review}${IS_REVIEW_BRANCH:-Development}"
echo -e "  ${BLUE}JIRA Issue:${NC} ${STORY_ID:-Not specified}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. cd $WORKTREE_DIR"
echo "  2. Start development"
echo "  3. yarn dev to run the app"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"