#!/bin/bash

# Script to clean up git worktrees
# Usage: ./scripts/cleanup-worktrees.sh [--all|--merged|<branch-name>]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to remove a specific worktree
remove_worktree() {
    local worktree_path=$1
    local branch_name=$2
    
    echo -e "${YELLOW}Removing worktree: $branch_name${NC}"
    git worktree remove "$worktree_path" --force 2>/dev/null || true
    
    # Check if branch is fully merged
    if git branch -r --merged | grep -q "origin/$branch_name"; then
        echo -e "${GREEN}Branch $branch_name is merged, deleting...${NC}"
        git branch -D "$branch_name" 2>/dev/null || true
    fi
}

# Function to list all worktrees
list_worktrees() {
    echo -e "${GREEN}Current worktrees:${NC}"
    git worktree list
}

# Main logic
case "${1:-}" in
    "--all")
        echo -e "${RED}Removing ALL worktrees...${NC}"
        git worktree list --porcelain | grep '^worktree' | cut -d' ' -f2 | while read -r path; do
            if [[ "$path" != "$(git rev-parse --show-toplevel)" ]]; then
                branch=$(git worktree list --porcelain | grep -A1 "^worktree $path" | grep '^branch' | cut -d' ' -f2 | sed 's|refs/heads/||')
                remove_worktree "$path" "$branch"
            fi
        done
        ;;
    
    "--merged")
        echo -e "${YELLOW}Removing worktrees for merged branches...${NC}"
        git worktree list --porcelain | grep '^worktree' | cut -d' ' -f2 | while read -r path; do
            if [[ "$path" != "$(git rev-parse --show-toplevel)" ]]; then
                branch=$(git worktree list --porcelain | grep -A1 "^worktree $path" | grep '^branch' | cut -d' ' -f2 | sed 's|refs/heads/||')
                if git branch -r --merged | grep -q "origin/$branch"; then
                    remove_worktree "$path" "$branch"
                fi
            fi
        done
        ;;
    
    "")
        list_worktrees
        echo
        echo "Usage: $0 [--all|--merged|<branch-name>]"
        echo "  --all       Remove all worktrees"
        echo "  --merged    Remove worktrees for merged branches"
        echo "  <branch>    Remove specific worktree by branch name"
        ;;
    
    *)
        # Remove specific worktree
        branch_name=$1
        worktree_path="worktrees/$branch_name"
        
        if [ -d "$worktree_path" ]; then
            remove_worktree "$worktree_path" "$branch_name"
        else
            echo -e "${RED}Worktree not found: $worktree_path${NC}"
            exit 1
        fi
        ;;
esac

echo -e "${GREEN}Done!${NC}"