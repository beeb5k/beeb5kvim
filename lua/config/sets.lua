-- ================================
-- ⚡ Performance
-- ================================
vim.loader.enable() -- Enable faster Lua module loading
vim.o.updatetime = 50 -- Faster completion and CursorHold events

-- ================================
-- 🖥️ User Interface
-- ================================
vim.o.guicursor = "" -- Use block cursor
vim.o.termguicolors = true -- Enable 24-bit RGB colors
vim.o.showmode = false -- Don't show mode (handled by statusline)
vim.o.showcmd = true -- Hide command in the last line
vim.o.signcolumn = "yes" -- Always show sign column
-- vim.o.colorcolumn = "85" -- Highlight column 85
vim.o.cursorline = true -- Highlight current line
-- vim.o.winborder = "rounded"
vim.o.background = "dark"
-- vim.o.laststatus = 1
vim.o.conceallevel = 2
-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })

-- vim.o.wildmenu = false
-- vim.o.wildoptions = ""
-- vim.o.statuscolumn = [[%!v:lua.MyStatusCol()]]

-- ================================
-- 🔢 Line Numbers
-- ================================
vim.o.nu = true -- Absolute line numbers
vim.o.relativenumber = true -- Relative line numbers

-- ================================
-- 🖱️ Mouse and Scrolling
-- ================================
vim.o.mouse = "" -- Disable mouse support
vim.o.scrolloff = 20 -- Keep 20 lines above/below cursor

-- ================================
-- 🔑 Keybindings
-- ================================
vim.g.mapleader = " " -- Set leader key to Space

-- ================================
-- 📁 File Explorer & File Handling
-- ================================
vim.g.loaded_netrwPlugin = 1 -- Disable netrw file explorer

-- ================================
-- 🔤 Indentation and Tabs
-- ================================
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.tabstop = 4 -- Number of spaces per tab
vim.o.softtabstop = 4 -- Number of spaces for soft tab
vim.o.shiftwidth = 4 -- Number of spaces for indent
vim.o.smartindent = true -- Smart autoindenting
vim.o.smarttab = true -- Use shiftwidth at beginning of lines
vim.o.breakindent = true -- Wrap indent to match line start
-- vim.o.backspace = { "indent", "eol", "start" } -- Allow backspace through everything
vim.o.autoindent = true -- Copy indent from current line when starting new one

-- ================================
-- 🔃 Text Wrapping
-- ================================
vim.o.wrap = false -- Disable line wrapping
vim.o.linebreak = false -- Wrap long lines at word boundaries

-- ================================
-- 🔍 Search
-- ================================
vim.o.hlsearch = false -- Don't highlight search results
vim.o.incsearch = true -- Show search matches as you type

-- ================================
-- 🏷️ Misc
-- ================================
vim.o.title = true -- Set terminal title to file name
vim.o.swapfile = false

-- vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 99
-- vim.o.foldenable = false
-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
