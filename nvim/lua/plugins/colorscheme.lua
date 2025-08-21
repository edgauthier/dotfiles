-- Colorscheme configuration
return {
  {
    "altercation/vim-colors-solarized",
    name = "solarized",
    config = function()
      vim.g.solarized_termcolors = 256
      -- vim.cmd("colorscheme solarized") -- Uncomment to enable
      
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