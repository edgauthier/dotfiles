-- Status line configuration
local M = {}

function M.fugitive_status()
  if vim.fn.exists('*FugitiveStatusline') == 1 then
    return vim.fn['fugitive#statusline']()
  else
    return ''
  end
end

-- Set up the statusline format similar to original vimrc
vim.opt.statusline = "%<%f %{v:lua.require'config.statusline'.fugitive_status()}%h%m%r%=%-14.(%l,%c%V%) %P"

return M