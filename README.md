# Claude Template

## Project Structure

This project is organized as a Claude AI development template with documentation, configuration, and resources:

```
claude-template/
├── .claude/                    # Claude Code configuration
│   ├── commands/
│   │   ├── infinite.md        # Infinite mode command
│   │   ├── prime.md           # Prime context command
│   │   └── settings.local.json # Local Claude settings
│   └── settings.json          # Global Claude settings
├── ai_docs/                   # AI-related documentation
│   ├── anthropic-tool-use.md  # Anthropic tool usage guide
│   ├── code-standards.md      # Universal code standards and best practices
│   ├── project-management.md  # AI-assisted project management system
│   ├── react-native.md       # React Native development docs
│   └── supabase.md           # Supabase integration docs
├── specs/                     # Project specifications and JIRA MCP integration
│   ├── completed/             # Historical project milestones
│   │   └── archive-index.md   # Quick reference to completed work
│   ├── COMMIT_REFERENCE.md    # Commit message conventions with JIRA integration
│   ├── jira_integration.md    # JIRA MCP setup and conventions
│   └── project_plan.md        # Master project overview with JIRA references
├── .gitignore                 # Git ignore rules
├── .mcp.json                  # MCP server configuration (local only)
├── CLAUDE.md                  # Claude-specific documentation
└── README.md                 # This file
```

### Quick Start

```bash
# Clone the template
git clone git@github.com:alvinycheung/claude-code-template.git
cd claude-code-template

# Open in Cursor
cursor .

# Open in Claude Code in your Cursor Environment Terminal
claude

# Load project context with Claude
# Type: /prime
```

This will give you:

- A ready-to-use Claude development template
- Pre-configured Claude Code settings
- AI documentation and resources

## Important Files

### Claude Configuration

- `.claude/settings.json` - Global Claude Code settings and permissions
- `.claude/settings.local.json` - Local Claude Code settings (user-specific)
- `.claude/commands/prime.md` - Custom command to load project context
- `.claude/commands/infinite.md` - Infinite mode configuration

### AI Documentation

- `ai_docs/anthropic-tool-use.md` - Guide for using Anthropic's tool-calling features
- `ai_docs/code-standards.md` - Universal code standards and best practices
- `ai_docs/project-management.md` - AI-assisted project management system with hierarchical specs
- `ai_docs/react-native.md` - React Native development documentation
- `ai_docs/supabase.md` - Supabase integration and usage guide

### Project Specifications & JIRA Integration

- `specs/project_plan.md` - Master project overview with JIRA project references
- `specs/jira_integration.md` - JIRA MCP setup, conventions, and best practices
- `specs/COMMIT_REFERENCE.md` - JIRA-based commit message conventions
- **JIRA Issues** (via MCP) - Epics, Stories, Tasks, and Sub-tasks managed in JIRA

### Project Files

- `CLAUDE.md` - Main Claude-specific project documentation
- `mock_data.txt` - Sample data for development and testing
- `.mcp.json` - MCP (Model Context Protocol) server configuration (local only)
- `.gitignore` - Comprehensive ignore rules to protect sensitive configs

## Setup

### Initial Setup

1. **Clone this template:**

   ```bash
   git clone git@github.com:alvinycheung/claude-code-template.git
   cd claude-code-template
   ```

2. **Configure MCP servers (optional):**

   ```bash
   # Copy and customize your MCP configuration
   # Edit .mcp.json for your specific server setups
   # This file is ignored by git for security
   ```

3. **Customize Claude settings:**
   ```bash
   # Edit .claude/settings.local.json for your preferences
   # This file contains your personal Claude Code settings
   ```

### Development Workflow

1. **Use with Claude Code:** Open this project in Claude Code to get enhanced AI assistance
2. **Load project context:** Use `/prime` command to quickly load project understanding
3. **Follow project management system:** Use hierarchical specs (project → features → tasks)
4. **Maintain documentation:** Keep README.md and specs current during development
5. **Use proper commit conventions:** Follow patterns in `specs/COMMIT_REFERENCE.md`

#### Project Management System with JIRA MCP

This template includes a comprehensive AI-assisted project management system integrated with JIRA:

- **JIRA MCP Integration**: Direct connection between Claude and JIRA for seamless project management
- **Hierarchical Issue Management**: Epics → Stories → Tasks/Sub-tasks in JIRA
- **Status Tracking**: Leverage JIRA's native workflows and status management
- **Documentation Maintenance**: Built-in workflows for keeping docs and JIRA current
- **Query Optimization**: Smart loading of JIRA data only when needed

**Key Files:**

- `ai_docs/project-management.md` - Complete JIRA MCP system documentation
- `specs/jira_integration.md` - JIRA MCP setup and conventions
- `specs/project_plan.md` - Always loaded by `/prime` command with JIRA references
- `specs/COMMIT_REFERENCE.md` - JIRA-based commit message conventions

### Claude Code Integration

This project includes Claude Code configuration for enhanced development experience:

- **Custom Commands**: Use the `/prime` command in Claude Code to quickly load project context
- **Permissions**: Pre-configured permissions for common development tasks (mkdir, mv, ls)
- **Project Context**: The `.claude/commands/prime.md` file automatically reads key project files and shows the directory structure

To use with Claude Code:

1. Open the project in Claude Code
2. Type `/prime` to load the project context
3. Claude will have immediate understanding of the codebase structure and key files
4. Claude will automatically manage project specs and maintain documentation
5. Use the built-in project management workflows for efficient development

The `/prime` command automatically loads:

- Master project plan (`specs/project_plan.md`)
- Project management guidelines (`ai_docs/project-management.md`)
- Universal code standards (`ai_docs/code-standards.md`)

This gives Claude complete context for managing your project efficiently.
