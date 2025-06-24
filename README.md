# Claude Template

## Project Structure

This project is organized as a Claude AI development template with documentation, configuration, and resources:

```
claude-template/
├── .claude/                    # Claude Code configuration
│   ├── commands/              # Custom Claude commands
│   │   ├── claude_template_setup.md  # Template setup guide
│   │   ├── infinite.md               # Infinite mode command
│   │   ├── merge_all_approved_pull_requests.md # Auto-merge approved PRs
│   │   ├── prime.md                  # Prime context command
│   │   ├── prompt_writer.md          # Prompt writing assistant
│   │   ├── reflection.md             # Project instruction analysis
│   │   ├── respond_to_all_code_reviews.md  # Batch PR review responses
│   │   ├── technicalManager.md         # Technical manager workflow
│   │   ├── technicalManagerReorganization.md # Tech manager reorganization
│   │   ├── work_on_ticket_engineer.md       # Engineer role workflow
│   │   ├── work_on_ticket_parallel.md       # Parallel execution workflow
│   │   ├── work_on_ticket_respond_to_pr_comments.md # PR comment workflow
│   │   └── work_on_ticket_support_engineer.md # Support role workflow
│   ├── settings.json          # Global Claude settings
│   └── settings.local.json    # Local Claude settings override
├── ai_docs/                   # AI-related documentation
│   ├── anthropic-tool-use.md  # Anthropic tool usage guide
│   ├── jira-and-confluence-tool-use.md # JIRA and Confluence MCP integration
│   ├── react-native.md       # React Native development docs
│   └── supabase.md           # Supabase integration docs
├── scripts/                   # Utility scripts
│   ├── cleanup-worktrees.sh   # Clean up git worktrees
│   ├── setup-worktree.sh      # Create individual worktree
│   └── setup-worktree-batch.sh # Batch worktree creation
├── specs/                     # Project specifications and JIRA MCP integration
│   ├── code-standards.md      # Universal code standards and best practices
│   ├── project-management.md  # AI-assisted project management system
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
  - `work_on_ticket_engineer.md` - Engineer-focused ticket workflow
  - `work_on_ticket_parallel.md` - Parallel execution for complex tasks
  - `work_on_ticket_support_engineer.md` - Support-focused ticket workflow
  - `work_on_ticket_respond_to_pr_comments.md` - Dedicated PR comment response workflow
  - `respond_to_all_code_reviews.md` - Batch processing for multiple PR reviews
  - `merge_all_approved_pull_requests.md` - Automatically merge approved PRs
  - `technicalManager.md` - Technical manager workflow for strategic decisions
  - `technicalManagerReorganization.md` - Tech manager reorganization workflow
  - `prompt_writer.md` - Prompt writing assistant
  - `reflection.md` - Analyze and improve CLAUDE.md instructions

### AI Documentation

- `ai_docs/anthropic-tool-use.md` - Guide for using Anthropic's tool-calling features
- `ai_docs/jira-and-confluence-tool-use.md` - JIRA and Confluence MCP integration guide
- `ai_docs/react-native.md` - React Native development documentation
- `ai_docs/supabase.md` - Supabase integration and usage guide

### Project Specifications

- `specs/project_plan.md` - Master project overview with JIRA project references
- `specs/code-standards.md` - Universal code standards and best practices
- `specs/project-management.md` - AI-assisted project management system with hierarchical specs
- **JIRA Issues** (via MCP) - Epics, Stories, Tasks, and Sub-tasks managed in JIRA

### Project Files

- `CLAUDE.md` - Main Claude-specific project documentation
- `.mcp.json` - MCP (Model Context Protocol) server configuration (local only)
- `.gitignore` - Comprehensive ignore rules to protect sensitive configs
- `.claude/commands/settings.local.json` - Local Claude settings overrides

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
5. **Use proper commit conventions:** Follow JIRA-based commit message patterns

#### Project Management System with JIRA MCP

This template includes a comprehensive AI-assisted project management system integrated with JIRA:

- **JIRA MCP Integration**: Direct connection between Claude and JIRA for seamless project management
- **Hierarchical Issue Management**: Epics → Stories → Tasks/Sub-tasks in JIRA
- **Status Tracking**: Leverage JIRA's native workflows and status management
- **Documentation Maintenance**: Built-in workflows for keeping docs and JIRA current
- **Query Optimization**: Smart loading of JIRA data only when needed

**Key Files:**

- `specs/project-management.md` - Complete JIRA MCP system documentation
- `ai_docs/jira-and-confluence-tool-use.md` - JIRA MCP setup and conventions
- `specs/project_plan.md` - Always loaded by `/prime` command with JIRA references
- `specs/code-standards.md` - Universal code standards and best practices

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

2. **Work-on-Ticket Commands:**
   - `/work_on_ticket_engineer [JIRA-ID]` - Engineering-focused approach with deep technical analysis
   - `/work_on_ticket_support_engineer [JIRA-ID]` - Support-focused with customer impact analysis
   - `/work_on_ticket_parallel [JIRA-ID]` - Parallel execution for complex multi-step tasks
   - `/work_on_ticket_respond_to_pr_comments [PR_URL]` - Dedicated PR comment response workflow

3. **Management Commands:**
   - `/technicalManager` - Technical manager workflow for strategic decisions
   - `/technicalManagerReorganization` - Tech manager reorganization workflow

4. **Code Review Commands:**
   - `/respond_to_all_code_reviews` - Batch process multiple PR reviews
   - `/merge_all_approved_pull_requests` - Automatically merge approved PRs

5. **Utility Commands:**
   - `/infinite` - Continuous task execution mode for complex implementations
   - `/reflection` - Analyze and improve CLAUDE.md instructions
   - `/prompt_writer` - Assistant for writing and refining prompts
   - `/claude_template_setup` - Guide for setting up and customizing the template

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

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=alvinycheung/claude-code-template&type=Date)](https://star-history.com/#alvinycheung/claude-code-template&Date)
