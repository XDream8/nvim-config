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

local lsp_ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'java', 'html', 'lua', 'markdown', 'racket', 'rust', 'vim', 'tex', "toml"}
local on_file_open_events = { "BufRead", "BufWinEnter", "BufNewFile" }

return require('lazy').setup({
  -- speed up startup
  { 'lewis6991/impatient.nvim' },

  {
    "nvim-lua/plenary.nvim",
    module = "plenary",
  },

  {
    -- after = {'lualine', 'barbar'},
    'kyazdani42/nvim-web-devicons',
    module = "nvim-web-devicons",
    config = function() require "plugins.devicons" end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = on_file_open_events,
    config = function() require "plugins.indent-blankline" end,
  },

  -- theme
  {
    'folke/tokyonight.nvim',
    config = function()
        pcall(vim.cmd[[colorscheme tokyonight-storm]])
    end,
  },

  -- ui plugins
  {
    'lewis6991/gitsigns.nvim',
    event = 'InsertEnter',
    config = function() require "plugins.gitsigns" end
  },

  { 'rcarriga/nvim-notify' },

  {
    'feline-nvim/feline.nvim',
    event = on_file_open_events,
    config = function() require "plugins.feline" end,
  },

  {
    'numToStr/Comment.nvim',
    event = on_file_open_events,
    config = function()
        require('Comment').setup()
    end,
  },

  -- wakatime
  { 'wakatime/vim-wakatime' },

  -- lspconfig
  {
    'neovim/nvim-lspconfig',
    ft = lsp_ft,
    config = function() require "plugins.lsp" end,
  },
  -- mason
  {
    after = "nvim-lspconfig",
    'williamboman/mason.nvim',
    ft = lsp_ft,
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    -- requires = { 'williamboman/mason-lspconfig.nvim' },
    config = function() require "plugins.mason" end,
  },

  -- snippets
  {
    'rafamadriz/friendly-snippets',
    module = { "cmp", "cmp_nvim_lsp" },
    event = 'InsertEnter',
  },

  -- completion
  {
    'hrsh7th/nvim-cmp',
    after = "friendly-snippets",
    event = on_file_open_events,
    config = function() require "plugins.cmp" end,
  },

  {"saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
  {"hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" },
  { "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" },
  { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" },
  { "hrsh7th/cmp-path", after = "cmp-buffer" },

  -- luasnip
  {
    'L3MON4D3/LuaSnip',
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function() require "plugins.luasnip" end,
  },

  -- linter
  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function() require "plugins.null-ls" end,
  },

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" },
    event = on_file_open_events,
    config = function() require "plugins.nvim-treesitter" end,
  },

  -- autopairs
  {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    event = on_file_open_events,
    config = function() require "plugins.autopairs" end,
  },

  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
  },
})
