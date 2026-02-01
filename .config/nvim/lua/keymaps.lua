local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local iopts = { noremap = true, silent = true }

-- 保存/終了
-- map("n", "<leader>w", "<cmd>w<cr>", opts)
-- map("n", "<leader>q", "<cmd>q<cr>", opts)
-- map("n", "<leader>Q", "<cmd>qa!<cr>", opts)

-- 検索ハイライト解除
map("n", "<esc>", "<cmd>nohlsearch<cr><esc>", opts)

-- 折返し行で自然に上下
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

-- インデント後も選択維持
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- 行の入れ替え
map("v", "J", ":m '>+1<cr>gv=gv", opts)
map("v", "K", ":m '<-2<cr>gv=gv", opts)

-- ビジュアル貼り付けでレジスタを汚さない
map("x", "p", '"_dP', opts)

-- ウィンドウ
map("n", "<leader>sv", "<cmd>vsplit<cr>", opts)
map("n", "<leader>sh", "<cmd>split<cr>", opts)
map("n", "<leader>se", "<C-w>=", opts)
map("n", "<leader>sx", "<cmd>close<cr>", opts)

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- バッファ
map("n", "<S-h>", "<cmd>bprevious<cr>", opts)
map("n", "<S-l>", "<cmd>bnext<cr>", opts)
map("n", "<leader>bd", "<cmd>bdelete<cr>", opts)

-- Insert
map("i", "jj", "<Esc>", iopts)
-- Insert中、区切り文字の後で undo を区切る
map("i", ",", ",<C-g>u", iopts)
map("i", ".", ".<C-g>u", iopts)
map("i", "!", "!<C-g>u", iopts)
map("i", "?", "?<C-g>u", iopts)
map("i", ":", ":<C-g>u", iopts)
map("i", ";", ";<C-g>u", iopts)

-- Terminal
map("n", "<leader>tt", "<cmd>terminal<cr>", opts)
map("t", "<C-e>", [[<C-\><C-n>]], opts)