# Claude Template

## Project Structure

This project is organized as a full-stack application with clear separation between frontend and backend:

```
benchy/

```

### Quick Start

```bash


```

This will start:

## Important Files

### Frontend (client/)

### Backend (server/)

### Configuration

- `.env` - Root environment variables for API keys
- `server/.env` - Server-specific environment variables
- `start.sh` - Convenience script to start both services
- `.claude/` - Claude Code configuration and commands
  - `.claude/settings.local.json` - Claude Code permissions and settings
  - `.claude/commands/prime.md` - Custom Claude commands for project context

## Setup

### Frontend Setup (client/)

```bash
# Navigate to client directory
cd client

npm install

# Or using yarn
yarn install

```

### Backend Setup (server/)

### Development Workflow

### Claude Code Integration

This project includes Claude Code configuration for enhanced development experience:

- **Custom Commands**: Use the `/prime` command in Claude Code to quickly load project context
- **Permissions**: Pre-configured permissions for common development tasks (mkdir, mv, ls)
- **Project Context**: The `.claude/commands/prime.md` file automatically reads key project files and shows the directory structure

To use with Claude Code:

1. Open the project in Claude Code
2. Type `/prime` to load the project context
3. Claude will have immediate understanding of the codebase structure and key files
