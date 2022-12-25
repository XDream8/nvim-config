local present, blankline = pcall(require, "indent_blankline")

if not present then
  return
end

local options = {
  char = "▏",
  use_treesitter = true,
  show_first_indent_level = true,
  indentLine_enabled = 1,
  filetype_exclude = {
    "help",
    "terminal",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    'checkhealth',
    'man',
    'dashboard',
    'git',
    'markdown',
    'text',
    'NvimTree',
    "mason",
    "",
  },
  buftype_exclude = {
    'terminal',
    'nofile',
    'quickfix',
    'prompt',
  },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,
}

blankline.setup(options)
