-- Tmux integration plugins
return {
  -- Navigate between vim and tmux splits
  {
    "christoomey/vim-tmux-navigator",
    config = function()
      vim.g.tmux_navigator_disable_when_zoomed = 1
    end,
  },

  -- Tmux syntax support
  {
    "tmux-plugins/vim-tmux",
    ft = "tmux",
  },

  -- Session management
  {
    "tpope/vim-obsession",
  },
}
