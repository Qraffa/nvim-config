require("nvim-treesitter.configs").setup({
  ensure_installed = {"lua", "vim", "go", "python"},
  highlight = {
    enable = true,
    additional_vim_regex_highlight = false
  }
})
