local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local b = null_ls.builtins

local sources = {
   -- some default stuff
   b.formatting.trim_newlines,
   b.formatting.trim_whitespace,
   b.diagnostics.todo_comments,
   b.diagnostics.trail_space,

   -- webdev stuff
   b.formatting.deno_fmt,
   b.formatting.prettier,

   -- Lua
   b.formatting.stylua,

   -- Shell
   b.formatting.beautysh,
   b.formatting.shfmt,
   -- b.formatting.shellharden,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   -- rust
   b.formatting.rustfmt,

   -- dprint
   b.formatting.dprint,
}

null_ls.setup {
   debug = true,
   sources = sources,
   on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
        })
      end
   end,
}
