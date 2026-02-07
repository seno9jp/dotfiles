# dotfiles

## Install

1. Download
    ```shell
    git clone https://github.com/seno9jp/dotfiles.git
    cd dotfiles/install_scripts
    ```

1. Install
    ```shell
    ./install.sh
    ```

1. Enjoy!

## Windows OS
Windows の Wezterm から WSL（Ubuntu）にマウントして利用する場合は、Windows側の```wezTerm.lua```に WSL側の```wezTerm.lua```を読み込むようにする。

1. WSL側に本体設定を置く（例）

    たとえば WSL(Ubuntu) 内に設定の本体```/home/<you>/dotfiles/.config/wezterm/wezterm.lua```を置く。

2. Windows側に“入口”設定を置く

    Windows版 WezTermは通常、次のどちらかを読む（どちらでもOK）。
    
    ```%USERPROFILE%\.wezterm.lua```
    ```%USERPROFILE%\.config\wezterm\wezterm.lua```
    
    ここに「WSL側の設定を読み込むだけ」のファイルを作る。例：```C:\Users\<you>\.config\wezterm\wezterm.lua```
　
    ```lua
    local wezterm = require "wezterm"

    -- エクスプローラで \\wsl$\Ubuntu-24.04\home\<you>\dotfiles\wezterm\wezterm.lua が見えるか確認
    local wsl_config = [[\\wsl$\Ubuntu-24.04\home\<you>\dotfiles\.config\wezterm\wezterm.lua]]

    local ok, cfg_or_err = pcall(dofile, wsl_config)
    if ok then
        return cfg_or_err
    else
        wezterm.log_error("Failed to load WSL wezterm config: " .. tostring(cfg_or_err))
        -- 読めなかった時の最低限フォールバック（必要なら）
        return {
            color_scheme = "Builtin Solarized Dark",
        }
    end
    ```