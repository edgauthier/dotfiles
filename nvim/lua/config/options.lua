-- Neovim options configuration
-- Migrated from vimrc settings

local opt = vim.opt

-- General settings
opt.compatible = false -- Disable vi compatibility (default in nvim)

-- Tab and indentation settings
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.shiftround = true
opt.expandtab = true
opt.autoindent = true

-- Search settings
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true
opt.gdefault = true
opt.hlsearch = true

-- Editor behavior
opt.hidden = true
opt.backspace = { "indent", "eol", "start" }
opt.joinspaces = false
opt.scrolloff = 3
opt.mouse = "a"

-- Display settings
opt.showmode = true
opt.showcmd = true
opt.title = true
opt.titleold = ""
opt.ruler = true
opt.laststatus = 2
opt.relativenumber = true
opt.number = true
opt.cursorline = true

-- Performance and behavior
opt.ttyfast = true
opt.errorbells = false
opt.shortmess:append("atI")
opt.history = 1000

-- File handling
opt.encoding = "utf-8"
opt.fileformats = { "unix", "dos" }

-- Text formatting
opt.wrap = true
opt.textwidth = 76
opt.formatoptions = "coqrnlb1"
opt.linebreak = true

-- Completion
opt.wildmenu = true
opt.wildmode = "list:longest"

-- Window behavior
opt.splitright = true
opt.splitbelow = true

-- Whitespace visualization
opt.listchars = { tab = ">-", trail = "·", eol = "$" }

-- Background (default to dark)
opt.background = "dark"

-- Enable filetype detection and plugins
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

-- Load matchit macro
vim.cmd("runtime macros/matchit.vim")