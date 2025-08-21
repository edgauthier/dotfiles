-- Markdown support plugins
return {
  -- Table alignment
  {
    "godlygeek/tabular",
    cmd = "Tabularize",
  },

  -- Markdown syntax and features
  {
    "plasticboy/vim-markdown",
    dependencies = { "godlygeek/tabular" },
    ft = "markdown",
    config = function()
      -- Markdown settings
      vim.g.vim_markdown_initial_foldlevel = 100
      vim.g.vim_markdown_folding_disabled = 1
    end,
  },

  -- Table mode for easy table creation
  {
    "dhruvasagar/vim-table-mode",
    ft = "markdown",
    config = function()
      vim.g.table_mode_always_active = 0
      vim.g.table_mode_corner = "|"
    end,
  },
}
