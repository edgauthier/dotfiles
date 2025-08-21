-- LSP and diagnostics (modern replacement for Syntastic)
return {
  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Mason setup for automatic LSP server installation
      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = false, -- Disable automatic installation
        ensure_installed = {}, -- Empty list - install manually as needed
      })
      
      -- Only set up LSP servers if they're actually installed
      local lspconfig = require("lspconfig")
      
      -- Function to safely setup LSP if executable exists
      local function setup_lsp_if_available(server_name, executable)
        if vim.fn.executable(executable) == 1 then
          lspconfig[server_name].setup({})
        end
      end
      
      -- Setup common LSP servers only if they're installed
      if vim.fn.executable("lua-language-server") == 1 then
        lspconfig.lua_ls.setup({
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
              },
              diagnostics = {
                globals = { 'vim' }, -- Recognize 'vim' global
                disable = { 'trailing-space', 'empty-block' }, -- Disable various warnings
              },
              workspace = {
                library = {
                  vim.env.VIMRUNTIME,
                  vim.fn.stdpath("config") .. "/lua",
                  "${3rd}/luv/library",
                },
                checkThirdParty = false,
                maxPreload = 100000,
                preloadFileSize = 10000,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        })
      end
      setup_lsp_if_available("ts_ls", "typescript-language-server")
      setup_lsp_if_available("pyright", "pyright")
      
      -- Global mappings for LSP (only when LSP is active)
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })
      vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, { desc = 'Previous diagnostic' })
      vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, { desc = 'Next diagnostic' })
    end,
  },
}
