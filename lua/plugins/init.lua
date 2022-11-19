local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local lsp_ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'lua','markdown', 'racket', 'rs', 'vim', 'tex'}
local on_file_open_events = { "BufRead", "BufWinEnter", "BufNewFile" }

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- speed up startup
  use 'lewis6991/impatient.nvim'

  use {
    "nvim-lua/plenary.nvim",
    module = "plenary",
  }

  use {
    -- after = {'lualine', 'barbar'},
    'kyazdani42/nvim-web-devicons',
    module = "nvim-web-devicons",
    config = function() require "plugins.devicons" end,
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    event = on_file_open_events,
    config = function() require "plugins.indent-blankline" end,
  }

  -- theme
  use { 
    'dracula/vim', as = 'dracula',
    config = function() vim.cmd[[colorscheme dracula]] end,
  }

  -- ui plugins
  use {
    'lewis6991/gitsigns.nvim',
    event = 'InsertEnter',
    config = function() require "plugins.gitsigns" end
  }

  use 'rcarriga/nvim-notify'

  use {
    'romgrk/barbar.nvim',
    wants = "nvim-web-devicons",
    event = {"BufAdd", "tabnew"},
  }

  use {
    'nvim-lualine/lualine.nvim',
    event = on_file_open_events,
    config = function() require "plugins.lualine" end,
  }

  use {
    'numToStr/Comment.nvim',
    event = on_file_open_events,
    config = function()
        require('Comment').setup()
    end,
  }

  -- lspconfig
  use {
    'neovim/nvim-lspconfig',
    ft = lsp_ft,
    config = function() require "plugins.lsp" end,
  }
  -- mason
  use {
    after = "nvim-lspconfig",
    'williamboman/mason.nvim',
    ft = lsp_ft,
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    -- requires = { 'williamboman/mason-lspconfig.nvim' },
    config = function() require "plugins.mason" end,
  }
  
  -- snippets
  use {
    'rafamadriz/friendly-snippets',
    module = { "cmp", "cmp_nvim_lsp" },
    event = 'InsertEnter',
  }
   -- completion
  use {
    'hrsh7th/nvim-cmp',
    after = "friendly-snippets",
    event = on_file_open_events,
    config = function() require "plugins.cmp" end,
  }

  use {"saadparwaiz1/cmp_luasnip", after = "LuaSnip" }
  use {"hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" }
  use { "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" }
  use { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" }
  use { "hrsh7th/cmp-path", after = "cmp-buffer" }

  -- luasnip
  use {
    'L3MON4D3/LuaSnip',
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function() require "plugins.luasnip" end,
  }

  -- linter
  use {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function() require "plugins.null-ls" end,
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" },
    event = on_file_open_events,
    config = function() require "plugins.nvim-treesitter" end,
  }

  -- autopairs
  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    event = on_file_open_events,
    config = function() require "plugins.autopairs" end,
  }


  -- Lazy loading:
  -- Load on specific commands
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  -- use {'andymass/vim-matchup', event = 'VimEnter'}

  use {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
