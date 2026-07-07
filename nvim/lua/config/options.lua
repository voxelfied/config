-- NeoVim Formatting
vim.opt.tabstop= 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.numberwidth = 4
vim.opt.cursorline = true
--vim.opt.virtualedit = "onemore"
vim.opt.smartindent = true

-- NeoVim Interaction
vim.opt.mouse = "a"
vim.opt.cmdheight = 0

-- NeoVim Windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Line Numbers & Columns
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.signcolumn = 'yes'
vim.cmd [[highlight CursorLineNr guifg=#F2953B]]

-- True Color Support & Colorscheme
vim.opt.termguicolors = true

-- Buffer Characters
vim.opt.fillchars = { eob = " " }
vim.cmd [[highlight VertSplit guifg=#232A2E guibg=#2D353B]]
vim.opt.list= true
vim.opt.showbreak = '▶'
vim.opt.listchars = { space = "·", eol = " " }
vim.cmd [[highlight WinSeparator guifg=#56635F guibg=#2D353B]]

-- Make Cursor Blink
vim.opt.guicursor = {
    'n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100',
    'i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100',
    'r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100'
}

-- Highlights
vim.cmd [[highlight Normal guibg=#2D353B ctermbg=235]]
vim.cmd [[highlight FloatBorder guifg=#D3C6AA guibg=none]]
vim.cmd [[highlight NormalFloat guifg=#D3C6AA guibg=none]]
vim.cmd [[highlight TelescopeBorder guifg=#A7C080 guibg=none]]
vim.cmd([[highlight NvimTreeIndentMarker guifg=#3b3b3b guibg=none]])
vim.cmd [[highlight BufferLineSeparator guifg=#232A2E]]
vim.cmd [[highlight BufferLineSeparatorSelected guifg=#232A2E]]
vim.cmd [[highlight BufferLineFill guibg=#232A2E]]

-- System
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.opt.conceallevel = 0
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.notify = require("notify")
