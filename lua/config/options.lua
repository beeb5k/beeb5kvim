-- vim.loader.enable()
vim.o.updatetime = 50

vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")

vim.o.termguicolors = true
vim.o.showmode = false
vim.o.showcmd = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.winborder = "single"
vim.o.background = "dark"
vim.o.conceallevel = 2
vim.o.autoread = true

vim.o.nu = true
vim.o.relativenumber = true

vim.o.mouse = ""
vim.o.scrolloff = 21

vim.g.mapleader = " "

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.breakindent = true
vim.o.autoindent = true

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
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

vim.g.loaded_perl_provider = 1
vim.g.loaded_ruby_provider = 1
vim.g.loaded_node_provider = 1
vim.g.loaded_python_provider = 1
vim.g.loaded_python3_provider = 1
