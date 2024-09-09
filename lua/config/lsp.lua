require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "vimls", "gopls", "pyright", "rust_analyzer" }
})

local navic = require("nvim-navic")
navic.setup({
	highlight = true
})

local lspconfig = require('lspconfig')
local lsp_signature = require('lsp_signature')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
		pattern = '*.rs,*cpp',
		callback = function()
			vim.lsp.buf.format({async=false})
		end
	})

	vim.api.nvim_create_autocmd({'BufWritePre'}, {
		pattern = "*.go",
	  callback = function()
	    local params = vim.lsp.util.make_range_params()
	    params.context = {only = {"source.organizeImports"}}
	    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
	    -- machine and codebase, you may want longer. Add an additional
	    -- argument after params if you find that you have to write the file
	    -- twice for changes to be saved.
	    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
	    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
	    for cid, res in pairs(result or {}) do
	      for _, r in pairs(res.result or {}) do
	        if r.edit then
	          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
	          vim.lsp.util.apply_workspace_edit(r.edit, enc)
	        end
	      end
	    end
	    vim.lsp.buf.format({async = false})
	  end
	})

	-- vim.api.nvim_command("au BufWritePost <buffer> lua vim.lsp.buf.formatting()")

	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
	vim.keymap.set('n', '<Leader>te', function() vim.diagnostic.open_float() end, bufopts)
	lsp_signature.on_attach({}, bufnr)

	navic.attach(client, bufnr)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig['lua_ls'].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig['vimls'].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig['gopls'].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

lspconfig['pyright'].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig['clangd'].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})


-- lspconfig['rust_analyzer'].setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })
--

require('rust-tools').setup({ server = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
})

-- require('protolint').setup({ server = {
-- 		on_attach = on_attach,
-- 		capabilities = capabilities,
-- 	}
-- })
