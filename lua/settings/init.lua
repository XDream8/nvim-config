local set = vim.opt

local present1, notify = pcall(require, "notify")

if present1 then
  vim.notify = require("notify")
end

-- completion
set.completeopt = 'menu,menuone,noselect'

-- clipboard
set.clipboard = 'unnamedplus'

-- don't show mode under lualine
set.showmode = false

-- tab settings
set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.softtabstop=4
set.tabstop=4

-- case insensitive (and smart) search
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

-- basic stuff
set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = 'utf-8'
set.termguicolors = true

-- line numbers and line highlighting
set.number = true
set.cursorline = true

-- redraw less
set.lazyredraw = true
set.updatetime = 300
set.timeoutlen = 500

set.hidden = true
