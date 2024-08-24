vim.o.swapfile = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.o.matchpairs = '(:),{:},[:]'
vim.o.matchpairs = vim.o.matchpairs .. ',<:>,「:」,『:』,【:】,“:”,‘:’,《:》'

require('plugins')
require('config.nvim-tree')
require('config.treesitter')
require('config.lualine')
require('config.which-key')
require('config.bufferline')
require('config.nvim-cmp')
require('config.lsp')
require('config.dashboard')
require('leap').add_default_mappings()
require('config.code-runner')
require('config.telescope')

vim.g.mapleader = ' '
local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }
keymap('', ';c', '"+y', opts)
keymap('n', '<C-s>', ':w<cr>', opts)
keymap('n', '<C-t>', ':FloatermToggle<cr>', opts)
keymap('t', '<C-t>', '<C-\\><C-n>:FloatermToggle<cr>', opts)

vim.o.foldmethod = 'expr'
vim.o.foldexpr='nvim_treesitter#foldexpr()'

local config_path = vim.fn.stdpath('config')
vim.cmd(string.format('source %s/core/wilder.vim', config_path))

-- vim.cmd.colorscheme("onedark")
-- vim.cmd.colorscheme("catppuccin-mocha")
vim.cmd.colorscheme("tokyonight-storm")
