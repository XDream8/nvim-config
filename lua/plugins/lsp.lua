-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true  }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local servers = { "sumneko_lua", "rust_analyzer", "bashls" }

-- lspconfig
local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		-- on_attach = on_attach,
		capabilities = capabilities,
	}
end
