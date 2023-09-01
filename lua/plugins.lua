-- 每次保存 plugins.lua 自动安装插件
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function (use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- theme
  use "olimorris/onedarkpro.nvim"

  -- 文件浏览器
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- 状态栏
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- buffer
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  -- 语法高亮
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- 快捷键
  use { "folke/which-key.nvim" }
	use {
		"windwp/nvim-autopairs",
 	  config = function() require("nvim-autopairs").setup {} end
	}
	-- dashboard
	use { 
		"glepnir/dashboard-nvim",
		event = 'VimEnter',
	}
	-- 注释
	use { "tpope/vim-commentary" }
	-- 搜索
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	-- 显示代码 context 的导航栏
	use { "SmiteshP/nvim-navic" }
	-- 快速跳转
	use { "ggandor/leap.nvim" }
	-- 命令行提示
	use { 'gelguy/wilder.nvim' }
	use { 'romgrk/fzy-lua-native' }
	-- terminal
	use { 'voldikss/vim-floaterm' }
	-- lsp cfg
  -- use {'neoclide/coc.nvim', branch = 'release'}
	use { "onsails/lspkind-nvim" }
	use { 
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"quangnguyen30192/cmp-nvim-ultisnips",
		}
	}
	use { "SirVer/ultisnips" }
	use { "williamboman/mason.nvim" }
	use { "williamboman/mason-lspconfig.nvim" }
	use { "neovim/nvim-lspconfig" }
	use { 
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	}
	use { 'tamago324/nlsp-settings.nvim' }
	use { 'williamboman/nvim-lsp-installer' }
	use { 'simrat39/rust-tools.nvim' }
	use { 'ray-x/lsp_signature.nvim' }
end)





