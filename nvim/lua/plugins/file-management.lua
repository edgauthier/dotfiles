-- File and buffer management plugins
return {
  -- File explorer (modern replacement for NERDTree)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
      })
      
      -- Update keymaps to use nvim-tree
      vim.keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })
      vim.keymap.set("n", "<leader>F", ":NvimTreeFindFile<CR>", { desc = "Find current file in tree" })
    end,
  },

  -- Buffer explorer
  {
    "jlanzarotta/bufexplorer",
    config = function()
      -- BufExplorer settings will work as-is
    end,
  },

  -- Fuzzy finder
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
  },
}