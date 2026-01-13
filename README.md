# Clemens' Neovim Configuration

A setup based on [NVChad](https://nvchad.com/), configured for development with LSP, AI assistance, LaTeX support, and various editing features.

## Summary

This configuration includes:

**Interface**
- Customized Catppuccin theme
- File navigation with nvim-tree and Oil.nvim
- Fuzzy finding with Telescope

**AI Assistance**
- **GitHub Copilot** for code completion
- **CodeCompanion** with Claude Sonnet 4.5 and GPT-4.1 for chat
- **MCPHub** for Model Context Protocol tools
- **Tavily** web search

**Note-Taking & Writing**
- **Telekasten** for Zettelkasten notes with daily notes and backlinks
- **Markview** for Markdown rendering
- **image.nvim** for image preview (requires Kitty terminal)
- **VimTeX** for LaTeX editing with continuous compilation and PDF preview

**Development**
- LSP support via Mason (TeXLab pre-configured)
- **Conjure** for REPL development (JavaScript/Node.js, Clojure, Fennel, etc.)
- Code formatting with conform.nvim
- Git integration with gitsigns and LazyGit
- TreeSitter syntax highlighting

**Editing**
- **Flash.nvim** for quick navigation
- nvim-surround for text objects
- Auto-pairing brackets and quotes
- Undo history with undotree
- Wrapped line navigation

**Other**
- Cross-platform (macOS and Linux)
- Plugin management with Lazy.nvim

## Requirements

- Neovim >= 0.11.0
- [NVChad](https://nvchad.com/) (base configuration framework)
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- ripgrep (for telescope grep)
- Node.js (for Copilot)
- Language-specific tools (LSP servers, formatters, linters)
- LaTeX distribution (for VimTeX)
- PDF viewer:
  - **macOS**: Preview (built-in)
  - **Linux**: Sioyek

### Optional

- [Kitty terminal](https://sw.kovidgoyal.net/kitty/) (for image rendering in Markdown files)

## Installation

### 1. Install Neovim

#### macOS
```bash
# Using Homebrew
brew install neovim

# Or download from GitHub releases
# https://github.com/neovim/neovim/releases
```

#### Linux (Ubuntu/Debian)
```bash
# Using apt (might not be latest version)
sudo apt install neovim

# For latest stable version, use AppImage or build from source:
# https://github.com/neovim/neovim/releases
```

#### Verify installation
```bash
nvim --version  # Should show >= 0.11.0
```

### 2. Install dependencies

#### macOS
```bash
brew install git ripgrep node
```

#### Linux (Ubuntu/Debian)
```bash
sudo apt install git ripgrep nodejs npm
```

### 3. Install a Nerd Font

Download and install a [Nerd Font](https://www.nerdfonts.com/) (e.g., JetBrains Mono Nerd Font, Hack Nerd Font) and configure your terminal to use it.

### 4. Backup existing Neovim configuration
```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
```

### 5. Clone this repository
```bash
git clone https://github.com/cklokmose/nvim-config ~/.config/nvim
```

### 6. Clean any existing Neovim data
**(Important for cross-platform setup)**
```bash
rm -rf ~/.local/share/nvim ~/.cache/nvim
```

### 7. Start Neovim
```bash
nvim
```

NVChad and all plugins will install automatically on first launch. This may take a few minutes.

### 8. Set up GitHub Copilot
```vim
:Copilot setup
```

### 9. Optional: Install additional dependencies

#### LaTeX Support (for VimTeX)

**macOS:**
```bash
# Install MacTeX (full distribution)
brew install --cask mactex

# Or BasicTeX (minimal distribution)
brew install --cask basictex

# Install neovim-remote for forward search
pip3 install neovim-remote
```

**Linux (Ubuntu/Debian):**
```bash
# Install TeX Live
sudo apt install texlive-full

# Or minimal installation
sudo apt install texlive-latex-base texlive-latex-extra

# Install PDF viewer (Sioyek)
sudo apt install sioyek

# Install neovim-remote for forward search
pip3 install neovim-remote
```

#### Git Integration (LazyGit)

**macOS:**
```bash
brew install lazygit
```

**Linux (Ubuntu/Debian):**
```bash
# Add PPA for latest version
sudo add-apt-repository ppa:lazygit-team/release
sudo apt update
sudo apt install lazygit

# Or download from GitHub releases:
# https://github.com/jesseduffield/lazygit/releases
```

**Note**: Always clean `~/.local/share/nvim` and `~/.cache/nvim` when moving this config between different operating systems (e.g., Linux ↔ macOS). This ensures all binaries and cache files are rebuilt for your current platform.

## Core Features

- **Base**: NVChad v2.5
- **Theme**: Catppuccin with custom highlights
- **LSP**: Language Server Protocol support (TeXLab for LaTeX)
- **AI Assistance**: 
  - GitHub Copilot for code completion
  - CodeCompanion with Claude Sonnet 4.5 and GPT-4.1
  - MCPHub integration for MCP tools
- **LaTeX**: VimTeX with LuaLaTeX (Preview on macOS, Sioyek on Linux)
- **Navigation**: Flash.nvim for quick jumps, Oil.nvim for file management
- **Editing**: nvim-surround, nvim-autopairs, undotree
- **File Explorer**: nvim-tree and Oil.nvim
- **Fuzzy Finder**: Telescope
- **Git Integration**: gitsigns, LazyGit

## Installed Plugins

### Note-taking & Knowledge Management
- **[telekasten.nvim](https://github.com/renerocksai/telekasten.nvim)** - Zettelkasten note-taking with daily notes and backlinks
- **[markview.nvim](https://github.com/OXY2DEV/markview.nvim)** - Markdown preview and rendering in Neovim

### AI & Completion
- **[copilot.vim](https://github.com/github/copilot.vim)** - GitHub Copilot integration
- **[codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim)** - AI coding assistant with Claude & GPT-4
- **[mcphub.nvim](https://github.com/ravitemer/mcphub.nvim)** - MCP (Model Context Protocol) hub integration
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Autocompletion engine
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** - Snippet engine

### LSP & Language Support
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP configuration (TeXLab enabled)
- **[mason.nvim](https://github.com/mason-org/mason.nvim)** - LSP/DAP/linter/formatter installer
- **[vimtex](https://github.com/lervag/vimtex)** - LaTeX editing and compilation
- **[conjure](https://github.com/Olical/conjure)** - Interactive REPL for JavaScript (Node.js), Clojure, Fennel, and other languages

### Navigation & Motion
- **[flash.nvim](https://github.com/folke/flash.nvim)** - Quick navigation with labels
- **[oil.nvim](https://github.com/stevearc/oil.nvim)** - File explorer as a buffer
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder
- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)** - Traditional file explorer

### Editing
- **[nvim-surround](https://github.com/kylechui/nvim-surround)** - Surround text objects with quotes, brackets, etc.
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Auto close brackets, quotes, etc.
- **[undotree](https://github.com/mbbill/undotree)** - Visualize undo history
- **[conform.nvim](https://github.com/stevearc/conform.nvim)** - Code formatting

### UI & Visual
- **[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)** - Indentation guides
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Git decorations
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** - Keybinding hints
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** - File icons
- **[mini.icons](https://github.com/echasnovski/mini.icons)** - Additional icons

### Syntax
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Advanced syntax highlighting and parsing

## Keybindings Cheatsheet

### General (NVChad Defaults)

| Key | Mode | Description |
|-----|------|-------------|
| `<Space>` | N | Leader key |
| `<C-s>` | N/I/V | Save file |
| `<C-c>` | N/I/V | Copy whole file |
| `<C-h/j/k/l>` | N | Navigate windows |
| `<Tab>` | N | Next buffer |
| `<S-Tab>` | N | Previous buffer |
| `<leader>x` | N | Close buffer |

### Custom general Keybindings

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>a` | N | Toggle completion |


### Flash Navigation

| Key | Mode | Description |
|-----|------|-------------|
| `s` | N/X/O | Flash jump |
| `S` | N/X/O | Flash Treesitter |
| `r` | O | Remote Flash |
| `R` | O/X | Treesitter Search |
| `<C-s>` | C | Toggle Flash Search |

### Wrapped Line Navigation

| Key | Mode | Description |
|-----|------|-------------|
| `<Alt-h>` | N/V/I | Move left one character |
| `<Alt-j>` | N/V/I | Move down one display line |
| `<Alt-k>` | N/V/I | Move up one display line |
| `<Alt-l>` | N/V/I | Move right one character |
| `<Alt-Left>` | N/V/I | Move left one character |
| `<Alt-Down>` | N/V/I | Move down one display line |
| `<Alt-Up>` | N/V/I | Move up one display line |
| `<Alt-Right>` | N/V/I | Move right one character |

### File Management

| Key | Mode | Description |
|-----|------|-------------|
| `<C-n>` | N | Toggle nvim-tree |
| `<leader>e` | N | Focus nvim-tree |
| `.` | N | Re-roots the nvim-tree to the current directory |
| `-` | N | Open Oil.nvim (parent directory) |

### Git

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>lg` | N | Open LazyGit |

### Telekasten (Note-taking)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>td` | N | Go to today's daily note |
| `<leader>tn` | N | Create new note |
| `<leader>tb` | N | Show backlinks |
| `<leader>tf` | N | Find notes |
| `<leader>tl` | N | Follow link under cursor |
| `<leader>cal`| N | Open calendar in vertical split |
| `<leader>caL`| N | Open calendar in horisontal split | 

### Markview (Markdown Preview)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>mt` | N | Toggle Markview |
| `<leader>ms` | N | Toggle Markview Split |

### Telescope (NVChad Defaults)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ff` | N | Find files |
| `<leader>fa` | N | Find all files |
| `<leader>fw` | N | Live grep |
| `<leader>fb` | N | Find buffers |
| `<leader>fh` | N | Help tags |
| `<leader>fo` | N | Old files |
| `<leader>fz` | N | Current buffer fuzzy find |
| `<leader>cm` | N | Git commits |
| `<leader>gt` | N | Git status |

### AI Assistants (CodeCompanion & Copilot)

#### CodeCompanion Chat Window

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>cc` | N | Open CodeCompanion chat |
| `gh` | CodeCompanion Chat | Open chat history (CodeCompanion-History) |
| `sc` | CodeCompanion Chat | Save current chat |
| `?` | CodeCompanion Chat | Show all keymaps |
| `<CR>` or `<C-s>` | CodeCompanion Chat | Send message to LLM |
| `q` | CodeCompanion Chat | Stop current request |
| `<C-c>` | CodeCompanion Chat | Close chat buffer |
| `ga` | CodeCompanion Chat | Change adapter (model) |
| `gc` | CodeCompanion Chat | Insert codeblock |
| `gd` | CodeCompanion Chat | View/debug chat contents |
| `gD` | CodeCompanion Chat | View super diff |
| `gr` | CodeCompanion Chat | Regenerate last response |
| `gR` | CodeCompanion Chat | Go to file under cursor |
| `gx` | CodeCompanion Chat | Clear chat buffer |
| `gy` | CodeCompanion Chat | Yank last codeblock |
| `[[` / `]]` | CodeCompanion Chat | Move to prev/next header |
| `{` / `}` | CodeCompanion Chat | Move to prev/next chat |

#### Copilot

| Key | Mode | Description |
|-----|------|-------------|
| `<Tab>` | I | Accept Copilot suggestion |
| `<leader>ct` | N | Toggle auto completion (disabled by default) |
| `:Copilot` | N | Copilot commands |

### LaTeX (VimTeX)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ll` | N | Start/toggle compilation |
| `<leader>lv` | N | View PDF |
| `<leader>lk` | N | Stop compilation |

*Note: These keymaps only work in `.tex` files*

### Conjure (JavaScript & REPL)

| Key | Mode | Description |
|-----|------|-------------|
| `æee` | N | Evaluate current form under cursor |
| `æer` | N | Evaluate root form |
| `æew` | N | Evaluate word under cursor |
| `æe!` | N | Evaluate and replace form with result |
| `æef` | N | Evaluate file from disk |
| `æeb` | N | Evaluate entire buffer |
| `æem{mark}` | N | Evaluate form at mark (e.g., `æemF`) |
| `æE` | V | Evaluate visual selection |
| `æE{motion}` | N | Evaluate motion (e.g., `æE2j`) |
| `æece` | N | Eval current form, insert result as comment |
| `æecr` | N | Eval root form, insert result as comment |
| `æecw` | N | Eval word, insert result as comment |
| `æls` | N | Open log in horizontal split |
| `ælv` | N | Open log in vertical split |
| `ælt` | N | Open log in new tab |
| `æle` | N | Open log in current window |
| `ælq` | N | Close all visible log windows |
| `æll` | N | Jump to latest result in log |
| `ælr` | N | Soft reset log (clear contents) |
| `ælR` | N | Hard reset log (delete buffer) |
| `æcr` | N | Restart the REPL |
| `K` | N | Look up documentation |
| `ægd` | N | Go to definition |
| `:ConjureSchool` | N | Start interactive tutorial |
| `:ConjureEval` | N | Evaluate code (accepts range) |
| `:ConjureConnect` | N | Connect to REPL |

*Note: `æ` is the localleader key. These keymaps work in JavaScript (`.js`), Clojure, Fennel, and other supported files*

### LSP (NVChad Defaults)

| Key | Mode | Description |
|-----|------|-------------|
| `gD` | N | Go to declaration |
| `gd` | N | Go to definition |
| `K` | N | Hover documentation |
| `gi` | N | Go to implementation |
| `<leader>D` | N | Type definition |
| `<leader>ra` | N | Rename symbol |
| `<leader>ca` | N | Code action |
| `gr` | N | References |
| `[d` | N | Previous diagnostic |
| `]d` | N | Next diagnostic |

### Undo History

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>u` | N | Toggle undotree |

### Surround (nvim-surround)

| Key | Mode | Description |
|-----|------|-------------|
| `ys{motion}{char}` | N | Add surrounding |
| `ds{char}` | N | Delete surrounding |
| `cs{old}{new}` | N | Change surrounding |
| `S{char}` | V | Surround selection |

*Examples: `ysiw"` - surround word with quotes, `ds"` - delete quotes, `cs"'` - change quotes to single quotes*

### Commenting (NVChad)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>/` | N/V | Toggle comment |

## AI Configuration

### CodeCompanion

CodeCompanion is configured with:
- **Chat Strategy**: Claude Sonnet 4.5 (via Copilot)
- **Inline Strategy**: GPT-4.1 (via Copilot)
- **Agent Strategy**: Claude Sonnet 4.5 (via Copilot)
- **MCPHub Integration**: Enabled with variables, slash commands, and chat output
- **Web Search**: Tavily provider with advanced search depth

### GitHub Copilot

- Active in all buffers (including CodeCompanion chat)
- Integrated with CodeCompanion for model access

### MCPHub

MCP (Model Context Protocol) integration for extending AI capabilities with tools and resources.

Commands:
- `:MCPHub` - Open MCPHub interface
- `:MCPServers` - List MCP servers
- `:MCPTools` - List available MCP tools

## LSP Configuration

### Configured Servers

- **TeXLab** - LaTeX language server (automatically enabled)

Install additional servers via `:Mason`

## LaTeX Workflow

1. Open a `.tex` file
2. Press `<leader>ll` to start continuous compilation
3. Press `<leader>lv` to open PDF in Sioyek
4. Edit your document - PDF updates automatically
5. Press `<leader>lk` to stop compilation when done

### VimTeX Configuration

- **Compiler**: XeLaTeX (via latexmk)
- **Viewer**: 
  - **macOS**: Preview (built-in)
  - **Linux**: Sioyek
- **Features**: Word wrap and line break enabled for `.tex` files

## Conjure Workflow (JavaScript & REPL)

### JavaScript (Node.js)

1. Open a JavaScript file (`.js`)
2. Conjure automatically starts a Node.js REPL in the background
3. Use `æee` to evaluate code under your cursor
4. Results appear in the log buffer (open with `æls`) or HUD
5. Evaluate selections with `æE` in visual mode

**Example workflow:**
```javascript
// Evaluate this line with æee
const result = 1 + 2;

// Evaluate this function with æee
function hello(name) {
  return `Hello, ${name}!`;
}

// Evaluate and see result: æew
hello("World");

// Evaluate entire file: æef
```

### Other Languages (Clojure, Fennel, etc.)

1. Open a supported file (`.clj`, `.fnl`, etc.)
2. Conjure automatically connects to your REPL
3. Use `æee` to evaluate forms
4. Results appear in log or HUD

### Quick Start

- **Evaluate code**: Place cursor on code and press `æee`
- **See results**: Press `æls` to open log in split, or results show in HUD
- **Evaluate selection**: Select code in visual mode and press `æE`
- **Evaluate file**: Press `æef` to load entire file into REPL
- **Interactive tutorial**: Run `:ConjureSchool`

### Conjure Configuration

- **Localleader**: `æ` (Danish keyboard friendly)
- **Log**: HUD (floating window) by default, persistent log available
- **Supported languages**: JavaScript (Node.js), Clojure, Fennel, Janet, Hy, Scheme, Racket, Common Lisp, Python, Lua, Rust, and more
- **REPL**: Automatically starts Node.js for JavaScript, connects to nREPL for Clojure, or stdio REPLs for other languages

## UI Configuration

### Theme: Catppuccin

- Primary theme: Catppuccin
- Toggle theme: Catppuccin ↔ One Dark (`:Telescope themes`)
- Custom highlights:
  - Current line number: Lavender
  - Line numbers: Surface2
  - Base05 override: Lavender

### UI Settings

- Completion style: Default
- Telescope style: Borderless
- Window border: Rounded (MCPHub)

## Directory Structure

```
~/.config/nvim/
├── init.lua                    # Entry point, loads NVChad and plugins
├── lazy-lock.json              # Plugin version lock file
├── .stylua.toml                # Stylua formatter config
├── lua/
│   ├── chadrc.lua             # NVChad UI configuration
│   ├── nvchad/                # NVChad core files (managed)
│   └── plugins/               # Custom plugin configurations
│       ├── init.lua           # Plugin loader (empty placeholder)
│       ├── codecompanion.lua  # AI assistant config
│       ├── conjure.lua        # JavaScript/Clojure REPL
│       ├── copilot.lua        # GitHub Copilot
│       ├── flash.lua          # Navigation plugin
│       ├── lspconfig.lua      # LSP setup (TeXLab)
│       ├── markview.lua       # Markdown preview
│       ├── mcphub.lua         # MCP hub config
│       ├── oil.lua            # Buffer-based file explorer
│       ├── surround.lua       # Surround plugin
│       ├── telekasten.lua     # Zettelkasten note-taking
│       ├── undotree.lua       # Undo history visualizer
│       └── vimtex.lua         # LaTeX support
└── README.md                   # This file
```

## Customization

### Adding Plugins

Create a new file in `lua/plugins/` with the plugin spec:

```lua
return {
  "username/repo",
  lazy = true,
  config = function()
    -- your config
  end,
}
```

### Modifying Theme

Edit `lua/chadrc.lua`:
- Change `theme` value
- Add custom highlights in `hl_override`
- Modify theme colors in `changed_themes`

### Adding LSP Servers

1. Install via Mason: `:Mason`
2. Add to `lua/plugins/lspconfig.lua`:
```lua
vim.lsp.config("servername", {})
vim.lsp.enable("servername")
```

### Custom Keymaps

Add to individual plugin configs in `lua/plugins/` using the `keys` table or create autocmds.

## Useful Commands

### Plugin Management
- `:Lazy` - Open Lazy.nvim plugin manager
- `:Lazy sync` - Update all plugins
- `:Lazy clean` - Remove unused plugins

### LSP
- `:LspInfo` - Show LSP server status
- `:Mason` - Open Mason installer
- `:MasonUpdate` - Update Mason packages

### LaTeX
- `:VimtexInfo` - Show VimTeX information
- `:VimtexCompile` - Start compilation
- `:VimtexClean` - Clean auxiliary files
- `:VimtexView` - Open PDF viewer

### Conjure (REPL)
- `:ConjureSchool` - Interactive tutorial
- `:ConjureEval <code>` - Evaluate code string
- `:ConjureConnect [host] [port]` - Connect to REPL
- `:ConjureClientState` - Get/set client state
- `:help conjure` - Full Conjure documentation

### AI
- `:Copilot status` - Check Copilot status
- `:Copilot setup` - Setup Copilot authentication
- `:CodeCompanionChat` - Open AI chat
- `:MCPHub` - Open MCP hub

### File Management
- `:Oil` - Open Oil file explorer
- `:NvimTreeToggle` - Toggle nvim-tree

## Resources

- [NVChad Documentation](https://nvchad.com/)
- [Neovim Documentation](https://neovim.io/doc/)
- [VimTeX Documentation](https://github.com/lervag/vimtex)
- [Conjure Documentation](https://github.com/Olical/conjure)
- [CodeCompanion Documentation](https://github.com/olimorris/codecompanion.nvim)
- [Flash.nvim Documentation](https://github.com/folke/flash.nvim)
- [Mason Registry](https://mason-registry.dev/registry/list)

## Troubleshooting

### LSP Issues
- Run `:LspInfo` to check server status
- Check `:Mason` for installed servers
- Review `:checkhealth` for system issues

### Copilot Not Working
- Run `:Copilot status`
- Authenticate with `:Copilot setup`
- Check Node.js is installed: `node --version`

### LaTeX Compilation Fails
- Verify LaTeX installation: `lualatex --version`
- Check `:VimtexInfo` for configuration
- Ensure `nvr` is installed: `pip install neovim-remote`

### Plugin Errors
- Run `:Lazy sync` to update plugins
- Check `:checkhealth lazy` for issues
- Review lazy-lock.json for version conflicts

### Theme/UI Issues
- Run `:NvChadUpdate` to update base46
- Clear cache: `rm -rf ~/.local/share/nvim/nvchad/base46`
- Restart Neovim

## License

Your configuration, your rules!

---

**Built with**: NVChad v2.5 • Neovim 0.11+ • Lazy.nvim
