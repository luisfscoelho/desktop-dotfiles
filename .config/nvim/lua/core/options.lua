local opt = vim.opt

vim.g.mapleader = " "

opt.syntax = "on"
opt.encoding = "UTF-8"
opt.number = true
opt.wildmenu = true
opt.title = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.guicursor = "a:ver100-blinkon10"

opt.spelllang = "en"

opt.textwidth = 100
opt.showmatch = true
opt.list = true
opt.hlsearch = true
opt.smartcase = true
opt.ignorecase = true
opt.incsearch = true
opt.autoindent = true

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.smarttab = true
opt.tabstop = 2
opt.softtabstop = 2

opt.hidden = true
opt.guifont = "Fira Code 12"
opt.ruler = true
opt.colorcolumn= "80,100"
opt.termguicolors = true
opt.errorbells = false
opt.visualbell = true
opt.listchars = {
  eol = "¬",
  tab = ">--",
  space= "·",
  trail = "~",
  extends = ">",
  precedes = "<",
}

opt.splitbelow = true
opt.splitright = true
opt.lazyredraw = true
opt.showmode = false
opt.cursorline = true
opt.inccommand = "nosplit"
opt.background = "dark"
opt.autoread = true

