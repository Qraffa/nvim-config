local wk = require('which-key')

wk.setup({
	plugins = {
		mark = false,
		registers = true,
	}
})

wk.add({
  { "<leader>b", group = "buffer" },
  { "<leader>bd", "<cmd>bdelete %<cr>", desc = "close current buffer" },
  { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "buffer line pick" },
  { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "buffer line next" },
  { "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "buffer line prev" },
  { "<leader>e", group = "NvimTree" },
  { "<leader>ee", "<cmd>NvimTreeToggle<cr>", desc = "nvim-tree toggle" },
  { "<leader>ef", "<cmd>NvimTreeFindFile<cr>", desc = "nvim-tree find file" },
  { "<leader>f", group = "telescope" },
  { "<leader>fb", "<cmd>Telescope buffer<cr>", desc = "find buffer" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files" },
  { "<leader>fg", "<cmd>Telescope live_grep_args<cr>", desc = "grep args" },
  { "<leader>fr", "<cmd>Telescope live_grep<cr>", desc = "grep" },
})

-- wk.register({
-- 	["<leader>"] = {
-- 		b = {
-- 			name = "+buffer",
-- 			d = { "<cmd>bdelete %<cr>", "close current buffer" },
-- 			j = { "<cmd>BufferLinePick<cr>", "buffer line pick" },
-- 			n = { "<cmd>BufferLineCycleNext<cr>", "buffer line next" },
-- 			p = { "<cmd>BufferLineCyclePrev<cr>", "buffer line prev" }
-- 		},
-- 		e = {
-- 			name = "+NvimTree",
-- 			e = { "<cmd>NvimTreeToggle<cr>", "nvim-tree toggle" },
-- 			f = { "<cmd>NvimTreeFindFile<cr>", "nvim-tree find file" },
-- 		},
-- 		f = {
-- 			name = "+telescope",
-- 			f = { "<cmd>Telescope find_files<cr>", "find files" },
-- 			b = { "<cmd>Telescope buffer<cr>", "find buffer" },
-- 			r = { "<cmd>Telescope live_grep<cr>", "grep" },
-- 			g = { "<cmd>Telescope live_grep_args<cr>", "grep args" }
-- 		},
-- 	},
-- })
