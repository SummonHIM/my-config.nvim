local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = { "c", "python", "vim", "vimdoc", "javascript", "html", "php" },
})
