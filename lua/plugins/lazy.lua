-- Install
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Require
local plugins = {
    -- Themes
    {
        "EdenEast/nightfox.nvim",
        config = function() require("plugins.EdenEast@nightfox") end
    },

    -- Functional
    ---- lualine: 更好看的状态条
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function() require("lualine").setup() end
    },
    ---- barbar: 文件选项卡。
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',    -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
        },
        init = function() require("plugins.romgrk@barbar") end
    },
    ---- nvim-tree: 树形文件浏览器
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup {}
            require("plugins.nvim-tree@nvim-tree")
        end
    },
    ---- which-key: 弹出式按键提示
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function() require("plugins.folke@which-key") end
    },
    ---- alpha-nvim: 开始页面
    {
        'goolord/alpha-nvim',
        config = function() require("plugins.goolord@alpha-nvim") end
    },
    ---- nvim-scrollbar: 滚动条
    {
        'petertriho/nvim-scrollbar',
        config = function() require("scrollbar").setup() end
    },

    -- Coding
    ---- aerial: 代码大纲目录
    {
        'stevearc/aerial.nvim',
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function() require("plugins.stevearc@aerial") end
    },
    ---- Telescope: 高级查找
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require("plugins.nvim-telescope@telescope") end
    },
    ---- nvim-treesitter-context: 当前函数显示
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function() require 'treesitter-context'.setup {} end
    },
    ---- glance: 定义，引用
    {
        'dnlhc/glance.nvim',
        config = function()
            require('glance').setup()
            require("plugins.dnlhc@glance")
        end
    },
    ---- sentiment: 高亮符号块
    {
        "utilyre/sentiment.nvim",
        version = "*",
        event = "VeryLazy", -- keep for lazy loading
        init = function()
            -- `matchparen.vim` needs to be disabled manually in case of lazy loading
            vim.g.loaded_matchparen = 1
        end,
    },
    ---- nvim-autopairs: 符号补全
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },

    -- LSP
    ---- nvim-lspconfig: 内置 LSP 配置
    {
        "neovim/nvim-lspconfig",
        config = function() require("plugins.neovim@nvim-lspconfig") end
    },
    ---- nvim-cmp: 自动补全
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            -- VSCode
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            -- Lua
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            -- ultimate solution for snippets
            'SirVer/ultisnips',
            'quangnguyen30192/cmp-nvim-ultisnips',
            -- snippy
            'dcampos/nvim-snippy',
            'dcampos/cmp-snippy'
        },
        config = function() require("plugins.hrsh7th@nvim-cmp") end
    },
    ---- nvim-treesitter: 代码高亮
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function() require("plugins.nvim-treesitter@nvim-treesitter") end
    },

    -- VCS
    ----Neogit: Git 管理
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = true
    },
    ---- GitSign: Git 标志
    {
        "lewis6991/gitsigns.nvim",
        config = function() require('gitsigns').setup() end
    }

}
require("lazy").setup(plugins)
