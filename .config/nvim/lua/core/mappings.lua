local utils = require "core.utils"

local map = utils.map

-- use ESC to turn off search highlighting
map("n", "<Esc>", ":noh <CR>")

-- toggle relative numbers
map("n", "<leader>cn", ":exec &nu==&rnu? 'se rnu!' : 'se nornu!'<CR>")

-- navigation in insert mode
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")
map("i", "<C-g>", "<ESC>^i")
map("i", "<C-;>", "<End>")

-- move.nvim
map("n", "<A-j>", ":MoveLine(1)<CR>", { noremap = true, silent = true })
map("n", "<A-k>", ":MoveLine(-1)<CR>", { noremap = true, silent = true })
map("v", "<A-j>", ":MoveBlock(1)<CR>", { noremap = true, silent = true })
map("v", "<A-k>", ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
map("n", "<A-l>", ":MoveHChar(1)<CR>", { noremap = true, silent = true })
map("n", "<A-h>", ":MoveHChar(-1)<CR>", { noremap = true, silent = true })
map("v", "<A-l>", ":MoveHBlock(1)<CR>", { noremap = true, silent = true })
map("v", "<A-h>", ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })

-- easier navigation between windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

map("n", "<leader>v", ":vsplit<CR>")
map("n", "<leader>x", ":split<CR>")

-- buffer
map("n", "<leader>t", ":tabnew <CR>")
map("n", "<leader>q", ":bdelete <CR>")
map("n", "<leader>Q", ":q! <CR>")
map("n", "<leader>w", ":w <CR>")

-- buffer line
map("n", "<TAB>", ":BufferLineCycleNext <CR>")
map("n", "<S-Tab>", ":BufferLineCyclePrev <CR>")
--map("n", "", ":BufferLineMoveNext<CR>")
--map("n", "", ":BufferLineMovePrev<CR>")

-- comment
map("n", "<leader>/", ":CommentToggle <CR>")
map("v", "<leader>/", ":CommentToggle <CR>")

-- nvimtree
map("n", "<leader>n", ":NvimTreeToggle <CR>")

-- telescope
map("n", "<leader>fb", ":Telescope buffers <CR>")
map("n", "<leader>ff", ":Telescope find_files <CR>")
map("n", "<leader>fa", ":Telescope find_files hidden=true <CR>")
map("n", "<leader>cm", ":Telescope git_commits <CR>")
map("n", "<leader>gs", ":Telescope git_status <CR>")
map("n", "<leader>fh", ":Telescope help_tags <CR>")
map("n", "<leader>fg", ":Telescope live_grep <CR>")
map("n", "<leader>fo", ":Telescope oldfiles <CR>")

-- nvim-cmp
--map("i", "<C-p>", ":")
--map("i", "<C-n>", ":")
--map("i", "<C-b>", ":")
--map("i", "<C-f>", ":")
--map("i", "<C->", ":")
--map("i", "<C-y>", ":")
--map("i", "<C-e>", ":")
--map("i", "<CR>", ":")

-- lsp
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "K",  "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

map("n", "<leader>D",  '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map("n", "<leader>rn", '<cmd>lua vim.lsp.buf.rename()<CR>')
map("n", "<leader>ca", '<cmd>lua vim.lsp.buf.code_action()<CR>')
map("n", "gr",         '<cmd>lua vim.lsp.buf.references()<CR>')
map("n", "ge",         '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
map("n", "[d",         '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map("n", "]d",         '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map("n", "<leader>d",  '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
map("n", "<leader>fm", '<cmd>lua vim.lsp.buf.formatting()<CR>')

-- trouble
map("n", "<leader>xx", "TroubleToggle<cr>")
map("n", "<leader>xw", "TroubleToggle workspace_diagnostics<cr>")
map("n", "<leader>xd", "TroubleToggle document_diagnostics<cr>")
map("n", "<leader>xq", "TroubleToggle quickfix<cr>")
map("n", "<leader>xl", "TroubleToggle loclist<cr>")
map("n", "gR", "TroubleToggle lsp_references<cr>")

-- spell
map("n", "<leader>zz", ":set spell! <CR>")

