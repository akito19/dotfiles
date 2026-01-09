-- Options configuration
-- Migrated from .vimrc

local opt = vim.opt

-- Character encoding
opt.encoding = "utf-8"
opt.fileencodings = { "ucs_bom", "utf8", "ucs-2le", "ucs-2" }
opt.fileformats = { "unix", "dos", "mac" }

-- Basic settings
opt.swapfile = false
opt.autoread = true
opt.ruler = true
opt.scrolloff = 5
opt.backspace = { "indent", "eol", "start" }
opt.clipboard = "unnamedplus"
opt.visualbell = true
opt.errorbells = false

-- Display settings
opt.title = true
opt.showmatch = true
opt.autoindent = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.cursorline = true
opt.ambiwidth = "double"
opt.laststatus = 2

-- LSP related settings
opt.hidden = true
opt.backup = false
opt.writebackup = false
opt.cmdheight = 2
opt.updatetime = 300
opt.shortmess:append("c")
opt.signcolumn = "yes"

-- Search settings
opt.wrapscan = true
opt.hlsearch = true

-- Split settings
opt.splitbelow = true

-- Enable syntax and filetype
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

-- Python/Ruby host programs for Neovim
vim.g.ruby_host_prog = vim.fn.expand("$HOME/.rbenv/shims/ruby")
vim.g.python3_host_prog = vim.fn.expand("$HOME/.pyenv/shims/python3")
