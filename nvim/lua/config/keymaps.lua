-- Key mappings configuration
-- Migrated from vimrc keymaps

local keymap = vim.keymap.set

-- Buffer management
keymap("n", "<leader>bb", ":b#<CR>", { desc = "Switch to alternate buffer" })
keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete current buffer" })

-- Window management
keymap("n", "<leader>wv", ":vnew<CR>", { desc = "Create vertical split" })
keymap("n", "<leader>wh", ":new<CR>", { desc = "Create horizontal split" })

-- Tab management
keymap("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })
keymap("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })

-- Search
keymap("n", "<leader><space>", ":noh<CR>", { desc = "Clear search highlighting", silent = true })
keymap("n", "/", "/\\v", { desc = "Search with very magic" })
keymap("v", "/", "/\\v", { desc = "Search with very magic" })

-- File operations
keymap("n", "<leader>f", ":NERDTreeToggle<CR>", { desc = "Toggle file tree" })
keymap("n", "<leader>F", ":NERDTreeFind<CR>", { desc = "Find current file in tree" })

-- Directory navigation
if vim.fn.has("unix") == 1 then
  keymap("n", "<leader>ee", ':e <C-R>=expand("%:p:h") . "/" <CR>', { desc = "Edit file in current directory" })
else
  keymap("n", "<leader>ee", ':e <C-R>=expand("%:p:h") . "\\" <CR>', { desc = "Edit file in current directory" })
end
keymap("n", "<leader>wd", ":cd %:p:h<CR>", { desc = "Set working directory to current file" })

-- Whitespace toggle
keymap("n", "<leader>ws", ":set nolist!<CR>", { desc = "Toggle whitespace visibility", silent = true })

-- Indentation with Tab/Shift+Tab
keymap("n", "<Tab>", ">>", { desc = "Indent line" })
keymap("n", "<S-Tab>", "<<", { desc = "Outdent line" })
keymap("i", "<Tab>", "<C-t>", { desc = "Indent in insert mode" })
keymap("i", "<S-Tab>", "<C-d>", { desc = "Outdent in insert mode" })
keymap("v", "<Tab>", ">gv", { desc = "Indent selection" })
keymap("v", "<S-Tab>", "<gv", { desc = "Outdent selection" })

-- HTML/XML comments
keymap("n", "<F5>", "mzI<!-- <Esc>A --><Esc>`z5l", { desc = "Add HTML comment" })
keymap("n", "<F6>", "mz0/<!-- <CR>df /--><CR>df><Esc>`z5h", { desc = "Remove HTML comment" })

-- Line bubbling (moving lines up/down)
keymap("n", "<S-k>", "[e", { desc = "Move line up" })
keymap("n", "<S-j>", "]e", { desc = "Move line down" })
keymap("v", "<S-k>", "[egv", { desc = "Move selection up" })
keymap("v", "<S-j>", "]egv", { desc = "Move selection down" })

-- Remap since we use J/K for bubbling
keymap("n", "<S-u>", "J", { desc = "Join lines" })
keymap("n", "<S-m>", "K", { desc = "Lookup keyword" })

-- Screen line movement (Mac/Windows)
keymap("n", "<D-j>", "gj", { desc = "Move down screen line (Mac)" })
keymap("n", "<D-k>", "gk", { desc = "Move up screen line (Mac)" })
keymap("n", "<D-4>", "g$", { desc = "End of screen line (Mac)" })
keymap("n", "<D-6>", "g^", { desc = "First non-blank screen line (Mac)" })
keymap("n", "<D-0>", "g0", { desc = "Beginning of screen line (Mac)" })
keymap("n", "<A-j>", "gj", { desc = "Move down screen line (Alt)" })
keymap("n", "<A-k>", "gk", { desc = "Move up screen line (Alt)" })
keymap("n", "<A-4>", "g$", { desc = "End of screen line (Alt)" })
keymap("n", "<A-6>", "g^", { desc = "First non-blank screen line (Alt)" })
keymap("n", "<A-0>", "g0", { desc = "Beginning of screen line (Alt)" })
keymap("v", "<D-j>", "gj", { desc = "Move down screen line (Mac)" })
keymap("v", "<D-k>", "gk", { desc = "Move up screen line (Mac)" })
keymap("v", "<D-4>", "g$", { desc = "End of screen line (Mac)" })
keymap("v", "<D-6>", "g^", { desc = "First non-blank screen line (Mac)" })
keymap("v", "<D-0>", "g0", { desc = "Beginning of screen line (Mac)" })
keymap("v", "<A-j>", "gj", { desc = "Move down screen line (Alt)" })
keymap("v", "<A-k>", "gk", { desc = "Move up screen line (Alt)" })
keymap("v", "<A-4>", "g$", { desc = "End of screen line (Alt)" })
keymap("v", "<A-6>", "g^", { desc = "First non-blank screen line (Alt)" })
keymap("v", "<A-0>", "g0", { desc = "Beginning of screen line (Alt)" })

-- Undo improvements
keymap("i", "<C-u>", "<C-g>u<C-u>", { desc = "Make Ctrl-U undoable" })
keymap("i", "<C-w>", "<C-g>u<C-w>", { desc = "Make Ctrl-W undoable" })

-- Select last edited/pasted text
keymap("n", "gV", "`[v`]", { desc = "Select last edited/pasted text" })

-- Background toggle
keymap("n", "<leader>bg", ":ToggleBG<CR>", { desc = "Toggle background" })

-- Semicolon as colon
keymap("n", ";", ":", { desc = "Use semicolon as colon" })
keymap("v", ";", ":", { desc = "Use semicolon as colon" })

-- Config file editing (updated for Neovim)
keymap("n", "<leader>ev", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit init.lua" })
keymap("n", "<leader>eg", ":e $MYGVIMRC<CR>", { desc = "Edit gvimrc" })
keymap("n", "<leader>sv", ":luafile ~/.config/nvim/init.lua<CR>", { desc = "Source init.lua" })
keymap("n", "<leader>sg", ":source $MYGVIMRC<CR>", { desc = "Source gvimrc" })

-- Markdown file save with filename from first line
keymap("n", "<leader>wm", ':execute "w ~/Desktop/".fnameescape(strpart(getline(1),2)."\\.md")<CR>', { desc = "Save markdown with title filename" })

-- Table formatting (will be available when tabular plugin is loaded)
keymap("n", "<leader>mt", ":Tabularize /|<CR>", { desc = "Format markdown table" })
keymap("v", "<leader>mt", ":Tabularize /|<CR>", { desc = "Format markdown table" })

-- Custom Perforce shortcut
keymap("n", "<leader>lpu", "/\\vend.*custom<CR>O<C-r>*<Esc>", { desc = "Perforce protect file paste" })