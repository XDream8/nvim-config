local set = vim.opt

local present1, notify = pcall(require, "notify")

if present1 then
  vim.notify = require("notify")
end

-----------------------------------------------------------
-- General
-----------------------------------------------------------
set.mouse = 'a'                       -- Enable mouse support
set.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
set.swapfile = false                  -- Don't use swapfile
set.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options
set.wrap = false
set.scrolloff = 5
set.fileencoding = 'utf-8'

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
set.expandtab = true        -- Use spaces instead of tabs
set.shiftwidth = 4          -- Shift 4 spaces when tab
set.tabstop = 4             -- 1 tab == 4 spaces
set.smartindent = true      -- Autoindent new lines

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
set.number = true           -- Show line number
set.showmatch = true        -- Highlight matching parenthesis
set.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')
set.colorcolumn = '80'      -- Line lenght marker at 80 columns
set.splitright = true       -- Vertical split to the right
set.splitbelow = true       -- Horizontal split to the bottom
set.ignorecase = true       -- Ignore case letters when search
set.smartcase = true        -- Ignore lowercase for the whole pattern
set.linebreak = true        -- Wrap on word boundary
set.termguicolors = true    -- Enable 24-bit RGB colors
set.laststatus=3            -- Set global statusline
set.cursorline = true       -- line highlighting
set.showmode = false        -- don't show mode under statusline

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
set.hidden = true           -- Enable background buffers
set.history = 100           -- Remember N lines in history
set.lazyredraw = true       -- Faster scrolling
set.synmaxcol = 240         -- Max column for syntax highlight
set.updatetime = 250        -- ms to wait for trigger an event

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
set.shortmess:append "sI"

-- -- Disable builtin plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
   vim.g["loaded_" .. plugin] = 1
end
