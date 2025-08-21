-- Autocommands configuration
-- Migrated from vimrc autocommands

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Create augroups
local general = augroup("General", { clear = true })

-- Make new empty files markdown by default
autocmd("BufEnter", {
  group = general,
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "" then
      vim.bo.filetype = "markdown"
    end
  end,
  desc = "Set filetype to markdown for empty files"
})

-- Auto set title string to current file
autocmd("BufEnter", {
  group = general,
  pattern = "*",
  callback = function()
    vim.opt.titlestring = vim.fn.expand("%")
  end,
  desc = "Set window title to current filename"
})