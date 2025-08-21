-- Neovim configuration entry point
-- Migrated from ~/.dotfiles/vimrc

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key before loading plugins
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Load configuration modules
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.statusline")

-- Setup plugins
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
})