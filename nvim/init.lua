-- 基本オプションの設定
require('options')

-- キーマップの設定
require('keymaps')

-- lazy.nvimの設定とプラグインの読み込み
require("config.lazy")
require("lazy").setup("plugins")