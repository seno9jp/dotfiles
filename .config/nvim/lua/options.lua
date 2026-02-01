local opt = vim.opt

-- 行番号の表示
opt.number = true
opt.relativenumber = false

-- タブとインデントの設定
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- cursor
opt.guicursor = table.concat({
  "n-v-c:block",
  "i-ci-ve:ver25-blinkwait700-blinkon400-blinkoff250",
  "r-cr:hor20",
  "o:hor50",
}, ",")

-- 検索設定
opt.ignorecase = true
opt.smartcase = true

opt.splitright = true
opt.splitbelow = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true

opt.updatetime = 300
opt.timeoutlen = 400

vim.opt.undofile = true
vim.opt.confirm = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.virtualedit = "block"