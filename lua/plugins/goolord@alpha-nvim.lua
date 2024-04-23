local alpha = require 'alpha'
local dashboard = require 'alpha.themes.dashboard'
dashboard.section.buttons.val = {
    dashboard.button("e", "  创建新文件", "<cmd>ene <CR>"),
    dashboard.button("SPC f f", "󰈞  查找现有文件"),
    dashboard.button("SPC f o", "󰊄  上次已打开的文件"),
    -- dashboard.button("SPC f r", "  Frecency/MRU"),
    dashboard.button("SPC f g", "󰈬  查找字符"), -- To use grep in windows. You must install it in https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation
    dashboard.button("SPC f m", "  书签"),
    -- dashboard.button("SPC s l", "  打开上一次使用的工作区"),
}
alpha.setup(dashboard.config)
