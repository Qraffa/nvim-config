local wk = require('which-key')

wk.setup({
	plugins = {
		mark = false,
		registers = true,
	}
})

wk.register({
	["<leader>"] = {
		b = {
			name = "+buffer",
			d = { "<cmd>bdelete %<cr>", "close current buffer" },
			j = { "<cmd>BufferLinePick<cr>", "buffer line pick" },
			n = { "<cmd>BufferLineCycleNext<cr>", "buffer line next" },
			p = { "<cmd>BufferLineCyclePrev<cr>", "buffer line prev" }
		},
		e = {
			name = "+NvimTree",
			e = { "<cmd>NvimTreeToggle<cr>", "nvim-tree toggle" },
			f = { "<cmd>NvimTreeFindFile<cr>", "nvim-tree find file" },
		},
		f = {
			name = "+telescope",
			f = { "<cmd>Telescope find_files<cr>", "find files" },
			b = { "<cmd>Telescope buffer<cr>", "find buffer" },
			r = { "<cmd>Telescope live_grep<cr>", "grep" }
		},
	},
})
