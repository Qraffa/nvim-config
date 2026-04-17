-- 每次保存 plugins.lua 自动安装插件
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
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
	use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
	-- 语法高亮
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	-- 快捷键
	use { "folke/which-key.nvim" }

	use { "echasnovski/mini.nvim" }

	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	-- dashboard
	use {
		"glepnir/dashboard-nvim",
		-- event = 'VimEnter',
	}
	-- 注释
	use {
		'numtostr/comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	-- 搜索
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope-live-grep-args.nvim' },
		}
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	-- 显示代码 context 的导航栏
	use { "SmiteshP/nvim-navic" }
	-- 快速跳转
	--  use { 'ggandor/leap.nvim' }
	use { 'https://codeberg.org/andyg/leap.nvim' }
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
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip"
		}
	}
	-- use { "SirVer/ultisnips" }
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
	-- rust-tools.nvim is archived and uses deprecated lspconfig APIs.
	-- Consider switching to 'mrcjkb/rustaceanvim' if you need extra Rust features.
	-- use { 'simrat39/rust-tools.nvim' }
	use { 'ray-x/lsp_signature.nvim' }
	use { 'folke/tokyonight.nvim' }
	use { 'catppuccin/nvim' }
	use { 'CRAG666/code_runner.nvim' }
	use {
		'folke/todo-comments.nvim',
		config = function() require("todo-comments").setup {} end
	}
	-- 快速文件标记与导航
	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } }
	}
	-- 诊断/搜索结果面板（VS Code 风格）
	use {
		"folke/trouble.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	}
end)
