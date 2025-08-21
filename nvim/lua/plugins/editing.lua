-- Editing enhancement plugins
return {
  -- Surround text objects
  {
    "tpope/vim-surround",
  },
  
  -- Repeat plugin commands with .
  {
    "tpope/vim-repeat",
  },
  
  -- Bracket mappings
  {
    "tpope/vim-unimpaired",
  },
  
  -- Yank ring functionality (modern replacement)
  {
    "gbprod/yanky.nvim",
    config = function()
      require("yanky").setup({
        ring = {
          history_length = 100,
          storage = "shada",
          sync_with_numbered_registers = true,
        },
        system_clipboard = {
          sync_with_ring = true,
        },
      })
      
      -- Set up keymaps
      vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
      vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
      vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")
    end,
  },
  
  -- JavaScript support
  {
    "pangloss/vim-javascript",
    ft = { "javascript", "js" },
  },
}