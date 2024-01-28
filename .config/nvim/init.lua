local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.showmatch = true
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.showtabline = 2
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 2
