-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
local telescope = require('telescope')
local actions  = require('telescope.actions')
local lga_actions = require("telescope-live-grep-args.actions")

-- Trouble 集成：将 Telescope 搜索结果发送到 Trouble 面板
local open_with_trouble = require("trouble.sources.telescope").open
local add_to_trouble = require("trouble.sources.telescope").add

telescope.setup {
  defaults = {
    -- 默认映射中添加 Trouble 集成
    mappings = {
      i = {
        -- 在 Trouble 中打开当前搜索结果（VS Code 风格侧边栏）
        ["<C-t>"] = open_with_trouble,
        -- 将结果追加到 Trouble
        ["<C-a>"] = add_to_trouble,
      },
      n = {
        ["<C-t>"] = open_with_trouble,
        ["<C-a>"] = add_to_trouble,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          -- freeze the current list and start a fuzzy search in the frozen list
          ["<C-space>"] = actions.to_fuzzy_refine,
          -- Trouble 集成
          ["<C-t>"] = open_with_trouble,
          ["<C-a>"] = add_to_trouble,
        },
        n = {
          ["<C-t>"] = open_with_trouble,
          ["<C-a>"] = add_to_trouble,
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
		}
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')
telescope.load_extension('live_grep_args')

-- === VS Code 风格搜索快捷键 ===
local builtin = require('telescope.builtin')

-- 全局搜索（类似 VS Code Ctrl+Shift+F）
vim.keymap.set("n", "<leader>sg", function()
  builtin.live_grep({
    prompt_title = "Global Search (Workspace)",
    additional_args = function(args)
      return vim.list_extend(args, { "--hidden", "--glob", "!**/.git/*" })
    end,
  })
end, { desc = "Search: Global Grep (VS Code Ctrl+Shift+F)" })

-- 当前文件内搜索（类似 VS Code Ctrl+F）
vim.keymap.set("n", "<leader>sf", function()
  builtin.current_buffer_fuzzy_find({
    prompt_title = "Search in Current File",
  })
end, { desc = "Search: Current File (VS Code Ctrl+F)" })

-- 文件搜索（类似 VS Code Ctrl+P）
vim.keymap.set("n", "<leader><leader>", builtin.find_files,
  { desc = "Search: Files (VS Code Ctrl+P)" })
vim.keymap.set("n", "<leader>ff", builtin.find_files,
  { desc = "Search: Find Files" })

-- 搜索并发送到 Trouble 面板（VS Code 风格搜索结果侧边栏）
vim.keymap.set("n", "<leader>ss", function()
  builtin.live_grep({
    prompt_title = "Search & Send to Trouble",
    default_text = vim.fn.expand("<cword>"),
    attach_mappings = function(_, map)
      map("i", "<CR>", open_with_trouble)
      map("n", "<CR>", open_with_trouble)
      return true
    end,
  })
end, { desc = "Search: Word & Open in Trouble Panel" })

-- 搜索光标下的单词并发送到 Trouble
vim.keymap.set("n", "<leader>sw", function()
  builtin.grep_string({
    prompt_title = "Search Word: " .. vim.fn.expand("<cword>"),
    word_match = "-w",
  })
end, { desc = "Search: Word Under Cursor" })

