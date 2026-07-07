local keymap = vim.keymap

-- NeoVim Keymaps - Windows/Navigation
keymap.set('n', '<Space>i', '<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>s', ':split<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>d', ':vsplit<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>j', '10j', { noremap = true, silent = true })
keymap.set('n', '<Space>k', '10k', { noremap = true, silent = true })
keymap.set('n', '<Space>g', ':wincmd w<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>b', ':wincmd W<CR>', { noremap = true, silent = true })

-- NeoVim Keymaps - Document/Selection
keymap.set('n', '<Space>q', ':q<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>w', ':w<CR>', { noremap = true, silent = true })
keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>x', ':wq<CR>', { noremap = true, silent = true })
keymap.set('i', '<C-a>', '<Esc>ggVG', {noremap = true, silent = true})
keymap.set('n', '<C-a>', 'ggVG', { noremap = true, silent = true })
keymap.set('i', '<C-l>', '<Esc>V', { noremap = true, silent = true })
keymap.set('v', '<Space>c', '"+y', { noremap = true, silent = true })
keymap.set('n', 'd', '"_d', { noremap = true, silent = true })
keymap.set('n', ')', '$l', { noremap = true, silent = true })
keymap.set('n', '<Space><Backspace>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- NeoVim Keymaps - Actions
keymap.set('n', '<Space>rr', ':luafile %<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>bb', ':lua delete_current_file()<CR>', {noremap = true, silent = true })
keymap.set('i', 'kj', '<Esc>', { noremap = true, silent = true })

-- Lazy Keymaps
keymap.set('n', '<C-c>l', ':Lazy<CR>', { noremap = true, silent = true })

-- Mason Keymaps
keymap.set('n', '<C-c>m', ':Mason<CR>', { noremap = true, silent = true })

-- NvimTree Keymaps
keymap.set('n', '<Space>ee', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>ef', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>ec', ':NvimTreeCollapse<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>er', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })

-- Treesitter Keymaps
keymap.set('n', '<Space>tp', ':TSPlaygroundToggle<CR>', { noremap = true, silent = true })

-- NvimTelescope Keymaps
keymap.set('n', '<Space>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- FileBrowser Keymaps
keymap.set('n', '<Space>fb', ':Telescope file_browser<CR>', { noremap = true, silent = true })

-- LinkVisitor Keymaps
keymap.set('n', '<Space>vl', ':VisitLinkUnderCursor<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>vla', ':VisitLinkInBuffer<CR>', { noremap = true, silent = true })

-- CarbonNow Keymaps
keymap.set('v', '<Space>ss', ':CarbonNow<CR>', { noremap = true, silent = true })

-- Bufferline Keymaps
keymap.set('n', '<Space>tt', ':tabnew<CR>:NvimTreeToggle<CR>:wincmd w<CR>:q<CR>j', { noremap = true, silent = true })
keymap.set('n', '<Space>hh', ':tabp<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>ll', ':tabn<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>to', ':tabnew %<CR>', { noremap = true, silent = true })

-- ChatGPT Keymaps
keymap.set('n', '<Space>ai', ':ChatGPT<CR>', { noremap = true, silent = true })

-- Live Server Keymaps
keymap.set('n', '<Space>ls', ':LiveServerStart<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>ld', ':LiveServerStop<CR>', { noremap = true, silent = true })

-- ToggleTerm Keymaps
keymap.set('n', '<Space>tr', ':ToggleTerm<CR>', { noremap = true, silent = true })
keymap.set('n', 'rt', ':ToggleTerm<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>th', ':ToggleTerm size=15 dir=~/Users/voxelfied/Desktop/Dev direction=horizontal name=term<CR>', { noremap = true, silent = false })
keymap.set('n', '<Space>ty', ':ToggleTerm size=40 dir=~/Users/voxelfied/Desktop/Dev direction=vertical name=term<CR>', { noremap = true, silent = false })
keymap.set('t', 'kj', '<C-\\><C-n>', { noremap = true, silent = true })

-- Move Keymaps
keymap.set('v', 'J', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
keymap.set('v', 'K', ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
keymap.set('v', 'L', ":MoveHChar(1)<CR>", { noremap = true, silent = true })
keymap.set('v', 'H', ":MoveHChar(-1)<CR>", { noremap = true, silent = true })
keymap.set('v', '<Space>L', ":MoveWord(1)<CR>", { noremap = true, silent = true })
keymap.set('v', '<Space>H', ":MoveWord(-1)<CR>", { noremap = true, silent = true })

-- Minimap Keymaps
keymap.set('n', '<Space>m', ':Minimap<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>mc', ':MinimapClose<CR>', { noremap = true, silent = true })

-- Neoformat Keymaps
keymap.set('n', '<Space>f', ':Neoformat<CR>', { noremap = true, silent = true })

-- IncRename Keymaps
keymap.set('n', '<Space>rn', ':IncRename<CR>', { noremap = true, silent = true })

-- Color Picker Keymaps
keymap.set('n', '<Space>cp', ':PickColor<CR>', { noremap = true, silent = true })
keymap.set('i', '<C-c>', ':PickColorInsert<CR>', { noremap = true, silent = true })

-- Telescope Tabs
keymap.set('n', '<Space>tl', ':Telescope telescope-tabs list_tabs<CR>', { noremap = true, silent = true })

-- ZenMode Keymaps
keymap.set('n', '<Space>z', ':ZenMode<CR>', { noremap = true, silent = true })

-- Unmap Keys
keymap.set('n', '<C-;>', '<Nop>', {noremap = true, silent = true })

require("config.utils")
