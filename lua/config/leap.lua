local leap = require('leap')

-- add_default_mappings() is deprecated, define mappings manually
-- See :help leap-mappings
vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-backward)')
vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')

leap.opts.safe_labels = {}
