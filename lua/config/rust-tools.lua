local rt = require('rust-tools')

rt.setup({
  server = {
    on_attach = function(_, bufnr)
			vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
				pattern = '*.rs',
				callback = function()
					vim.lsp.buf.format()
					vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
				end
			})
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
