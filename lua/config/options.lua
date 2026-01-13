vim.loader.enable()
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"

vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")

vim.o.termguicolors = true
vim.o.showmode = false
vim.o.showcmd = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.winborder = "rounded"
vim.o.background = "dark"
vim.o.conceallevel = 2
vim.o.autoread = true

vim.o.nu = true
vim.o.relativenumber = true

vim.o.mouse = ""
vim.o.scrolloff = 21

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = false
vim.o.smarttab = true
vim.o.breakindent = true
vim.o.autoindent = true

vim.o.completeopt = "menu,menuone,noselect"

vim.o.wrap = false
vim.o.linebreak = false

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.title = true
vim.o.swapfile = false

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.o.foldmethod = "expr"

vim.g.loaded_perl_provider = 1
vim.g.loaded_ruby_provider = 1
vim.g.loaded_node_provider = 1
vim.g.loaded_python_provider = 1
vim.g.loaded_python3_provider = 1
