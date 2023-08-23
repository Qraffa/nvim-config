" 设置行号
set number
" 设置相对行号
set relativenumber

set tabstop=2
set softtabstop=2
set shiftwidth=2

set clipboard+=unnamedplus

set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》

colorscheme onedark

" map
let g:mapleader = ' '
noremap ;c "+y
nnoremap <C-s> :w<cr>
nnoremap <C-t> :FloatermToggle<cr>
tnoremap <C-t> <C-\><C-n>:FloatermToggle<cr>

lua require('plugins')
" lua require('keymaps')

lua require('config.nvim-tree')
lua require('config.treesitter')
lua require('config.lualine')
lua require('config.which-key')
lua require('config.bufferline')
lua require('config.nvim-cmp')
lua require('config.lsp')
lua require('config.dashboard')
lua require('config.rust-tools')

lua require('leap').add_default_mappings()

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
autocmd BufReadPost,FileReadPost * normal zR

execute printf('source %s/core/%s', stdpath('config'), 'wilder.vim')
