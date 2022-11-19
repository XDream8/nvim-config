-- luasnip setup
local present, luasnip = pcall(require, "luasnip")

if present then
  require("luasnip.loaders.from_vscode").lazy_load()  
end

