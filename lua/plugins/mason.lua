-- mason

local ensure_installed = {
  "shfmt", "shellcheck", "shellharden", "beautysh",
  "rust-analyzer", "dprint",
}

require('mason').setup {
  ensure_installed = ensure_installed, -- not an option from mason.nvim

  providers = {
    "mason.providers.client",
    "mason.providers.registry-api",
  },

  PATH = "prepend",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ﮊ",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
  vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
end, {})
