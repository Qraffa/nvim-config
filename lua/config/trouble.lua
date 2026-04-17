-- Trouble: VS Code 风格的诊断/搜索结果面板
-- 功能：将搜索结果、诊断信息等以树形结构面板展示

require("trouble").setup({
  -- 自动关闭空结果
  auto_close = false,
  -- 自动打开当有结果时
  auto_open = false,
  -- 自动预览当前项
  auto_preview = true,
  -- 自动刷新
  auto_refresh = true,
  -- 打开时聚焦窗口
  focus = true,
  -- 恢复上次位置
  restore = true,
  -- 跟随当前项
  follow = true,
  -- 显示缩进引导线
  indent_guides = true,
  -- 最大显示项数
  max_items = 200,
  -- 多行消息
  multiline = true,
  -- 窗口配置：默认右侧 split（类似 VS Code 侧边栏）
  win = {
    type = "split",
    position = "right",
    size = 0.3,
  },
  -- 预览窗口配置
  preview = {
    type = "main",
    scratch = true,
  },
  -- 键位映射
  keys = {
    ["?"] = "help",
    r = "refresh",
    R = "toggle_refresh",
    q = "close",
    o = "jump_close",
    ["<esc>"] = "cancel",
    ["<cr>"] = "jump",
    ["<2-leftmouse>"] = "jump",
    ["<c-s>"] = "jump_split",
    ["<c-v>"] = "jump_vsplit",
    ["}"] = "next",
    ["]]"] = "next",
    ["{"] = "prev",
    ["[["] = "prev",
    dd = "delete",
    d = { action = "delete", mode = "v" },
    i = "inspect",
    p = "preview",
    P = "toggle_preview",
    zo = "fold_open",
    zO = "fold_open_recursive",
    zc = "fold_close",
    zC = "fold_close_recursive",
    za = "fold_toggle",
    zA = "fold_toggle_recursive",
    zm = "fold_more",
    zM = "fold_close_all",
    zr = "fold_reduce",
    zR = "fold_open_all",
  },
  -- 图标配置
  icons = {
    indent = {
      top = "│ ",
      middle = "├╴",
      last = "└╴",
      fold_open = " ",
      fold_closed = " ",
      ws = "  ",
    },
    folder_closed = " ",
    folder_open = " ",
  },
})

-- === VS Code 风格搜索栏快捷键 ===

-- 打开/关闭 Diagnostics 面板（类似 VS Code 问题面板）
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",
  { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  { desc = "Buffer Diagnostics (Trouble)" })

-- 打开 Symbols 面板（类似 VS Code 大纲视图）
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",
  { desc = "Symbols (Trouble)" })

-- LSP 相关面板
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  { desc = "LSP Definitions / references (Trouble)" })

-- Quickfix / Location List
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>",
  { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",
  { desc = "Quickfix List (Trouble)" })

-- Telescope 搜索结果发送到 Trouble（在 telescope.lua 中配置）
-- 这里提供一个手动触发的方式
vim.keymap.set("n", "<leader>ts", "<cmd>Trouble telescope_files toggle<cr>",
  { desc = "Telescope Results in Trouble" })
