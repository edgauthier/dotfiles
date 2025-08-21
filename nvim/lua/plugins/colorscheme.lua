-- Colorscheme configuration
return {
  {
    "altercation/vim-colors-solarized",
    name = "solarized",
    config = function()
      vim.g.solarized_termcolors = 256
      -- vim.cmd("colorscheme solarized") -- Uncomment to enable
      
      -- Improve line number visibility on dark background
      vim.api.nvim_set_hl(0, "LineNr", { fg = "#6272a4", bg = "NONE" }) -- Brighter gray
      vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f8f8f2", bg = "NONE", bold = true }) -- Bright white for current line
      
      -- Toggle background function (equivalent to togglebg)
      vim.api.nvim_create_user_command("ToggleBG", function()
        if vim.o.background == "dark" then
          vim.o.background = "light"
        else
          vim.o.background = "dark"
        end
      end, { desc = "Toggle background between light and dark" })
    end,
  },
}