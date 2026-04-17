-- Harpoon: 快速文件标记与导航
-- 功能：像 VS Code 的 pinned tabs 一样，快速访问常用文件
local harpoon = require("harpoon")

harpoon:setup({
  settings = {
    save_on_toggle = false,
    sync_on_ui_close = true,
  }
})

-- 基础快捷键（类似 VS Code 的 pinned files）
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end,
  { desc = "Harpoon: 添加当前文件" })
vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
  { desc = "Harpoon: 打开菜单" })

-- 快速选择前 4 个标记文件（类似 VS Code Alt+1/2/3/4）
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end,
  { desc = "Harpoon: 打开第1个文件" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end,
  { desc = "Harpoon: 打开第2个文件" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end,
  { desc = "Harpoon: 打开第3个文件" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end,
  { desc = "Harpoon: 打开第4个文件" })

-- 上一个/下一个标记文件
vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end,
  { desc = "Harpoon: 上一个文件" })
vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end,
  { desc = "Harpoon: 下一个文件" })

-- 扩展：支持在 split / vsplit / tab 中打开
harpoon:extend({
  UI_CREATE = function(cx)
    vim.keymap.set("n", "<C-v>", function()
      harpoon.ui:select_menu_item({ vsplit = true })
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-s>", function()
      harpoon.ui:select_menu_item({ split = true })
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-t>", function()
      harpoon.ui:select_menu_item({ tabedit = true })
    end, { buffer = cx.bufnr })
  end,
})
