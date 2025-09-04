-- ===============================
-- VimTeX configuration
-- ===============================
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
    build_dir = '',
    continuous = 1,
    callback = 1,
}

vim.g.vimtex_view_method = 'zathura'

vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_compiler_quiet = 0
vim.g.vimtex_indent_enabled = 1
vim.g.vimtex_view_silent = 1

-- Mappings
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Leader>ll', ':VimtexCompile<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>lv', ':VimtexView<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>lk', ':VimtexStop<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>lc', ':VimtexClean<CR>', opts)

-- Advanced highlight
vim.g.tex_flavor = "latex"
vim.g.vimtex_syntax_enabled = 1
vim.g.vimtex_syntax_conceal_disable = 1
