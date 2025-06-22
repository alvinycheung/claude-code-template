# Claude Template

## Project Structure

This project is organized as a Claude AI development template with documentation, configuration, and resources:

```
claude-template/
├── .claude/                    # Claude Code configuration
│   ├── commands/              # Custom Claude commands
│   │   ├── claude_template_setup.md  # Template setup guide
│   │   ├── infinite.md               # Infinite mode command
│   │   ├── prime.md                  # Prime context command
│   │   ├── respond_to_all_code_reviews.md  # Batch PR review responses
│   │   ├── respond_to_pr.md          # Individual PR response
│   │   ├── work_on_ticket.md         # General ticket workflow
│   │   ├── work_on_ticket_engineer.md       # Engineer role workflow
│   │   ├── work_on_ticket_parallel.md       # Parallel execution workflow
│   │   ├── work_on_ticket_project_manager.md # PM role workflow
│   │   └── work_on_ticket_support_engineer.md # Support role workflow
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
- `.claude/commands/` - Custom Claude commands directory:
  - `prime.md` - Load project context with key files and specs
  - `infinite.md` - Infinite mode for continuous task execution
  - `claude_template_setup.md` - Template setup and customization guide
  - `work_on_ticket.md` - General workflow for JIRA ticket development
  - `work_on_ticket_engineer.md` - Engineer-focused ticket workflow
  - `work_on_ticket_parallel.md` - Parallel execution for complex tasks
  - `work_on_ticket_project_manager.md` - PM perspective on ticket management
  - `work_on_ticket_support_engineer.md` - Support-focused ticket workflow
  - `respond_to_pr.md` - Automated PR review and response workflow
  - `respond_to_all_code_reviews.md` - Batch processing for multiple PR reviews

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

- **Custom Commands**: Multiple specialized commands for different workflows
- **Permissions**: Pre-configured permissions for common development tasks (mkdir, mv, ls)
- **Project Context**: Commands automatically load relevant project files and specs

#### Available Claude Commands

1. **`/prime`** - Load project context
   - Loads master project plan, project management guidelines, and code standards
   - Analyzes git status, recent commits, and available MCP tools
   - Essential for starting any development session

2. **`/work_on_ticket [JIRA-ID]`** - General ticket workflow
   - Loads ticket details from JIRA via MCP
   - Creates feature branch and implements solution
   - Handles testing, commits, and PR creation

3. **Role-Specific Workflows:**
   - `/work_on_ticket_engineer` - Engineering-focused approach with deep technical analysis
   - `/work_on_ticket_project_manager` - PM perspective with stakeholder considerations
   - `/work_on_ticket_support_engineer` - Support-focused with customer impact analysis
   - `/work_on_ticket_parallel` - Parallel execution for complex multi-step tasks

4. **Code Review Commands:**
   - `/respond_to_pr [PR_URL]` - Analyze and respond to individual PR reviews
   - `/respond_to_all_code_reviews` - Batch process multiple PR reviews

5. **`/infinite`** - Continuous task execution mode
   - Autonomous task management and completion
   - Ideal for complex multi-step implementations

To use with Claude Code:

1. Open the project in Claude Code
2. Start with `/prime` to load project context
3. Use appropriate command for your task (e.g., `/work_on_ticket PROJ-123`)
4. Claude will handle the complete workflow including:
   - Branch creation and management
   - Implementation with proper testing
   - Commit with JIRA references
   - PR creation when ready

The commands automatically maintain:
- Proper JIRA integration and status updates
- Consistent commit message formatting
- Documentation updates as needed
- Test coverage for new features
