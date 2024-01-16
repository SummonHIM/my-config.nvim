-- User config
vim.wo.number = true
vim.wo.wrap = false

-- Plugins
---- Lazy.nvim
------ Install
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

------ Require
local plugins = {
    -- Themes
    {
        "EdenEast/nightfox.nvim",
        config = function()
            vim.cmd("colorscheme Carbonfox")
        end
    },

    -- Functional
    ---- lualine: 更好看的状态条
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup()
        end,
    },
    ---- barbar: 文件选项卡。
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {}
    },
    ---- nvim-tree: 树形文件浏览器
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
            vim.keymap.set('n', '<C-b>', "<cmd>NvimTreeToggle<cr>")
        end,
    },
    ---- which-key: 弹出式按键提示
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    ---- alpha-nvim: 开始页面
    {
        'goolord/alpha-nvim',
        config = function()
            local alpha = require 'alpha'
            local dashboard = require 'alpha.themes.dashboard'
            dashboard.section.buttons.val = {
                dashboard.button("e", "  创建新文件", "<cmd>ene <CR>"),
                dashboard.button("SPC f f", "󰈞  查找现有文件"),
                -- dashboard.button("SPC f h", "󰊄  上次已打开的文件"),
                -- dashboard.button("SPC f r", "  Frecency/MRU"),
                dashboard.button("SPC f g", "󰈬  查找字符"), -- To use grep in windows. You must install it in https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation
                -- dashboard.button("SPC f m", "  书签"),
                -- dashboard.button("SPC s l", "  打开上一次使用的工作区"),
            }
            alpha.setup(dashboard.config)
        end
    },

    -- Coding
    ---- aerial: 代码大纲目录
    {
        'stevearc/aerial.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("aerial").setup({
                -- optionally use on_attach to set keymaps when aerial has attached to a buffer
                on_attach = function(bufnr)
                    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
                end,
            })
        end
    },
    ----Telescope: 高级查找
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    },

    -- LSP
    ---- nvim-lspconfig: 内置 LSP 配置
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Setup language servers.
            local lspconfig = require('lspconfig')
            require 'lspconfig'.clangd.setup {}
            -- lspconfig.pyright.setup {}
            -- lspconfig.tsserver.setup {}
            -- lspconfig.rust_analyzer.setup {
            --     -- Server-specific settings. See `:help lspconfig-setup`
            --     settings = {
            --         ['rust-analyzer'] = {},
            --     },
            -- }


            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set('n', '<space>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', '<space>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end,
            })
        end
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
        config = function()
            -- Set up nvim-cmp.
            local cmp = require 'cmp'

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'vsnip' }, -- For vsnip users.
                    -- { name = 'luasnip' }, -- For luasnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                }, {
                    { name = 'buffer' },
                })
            })

            -- Set configuration for specific filetype.
            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
                }, {
                    { name = 'buffer' },
                })
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })

            -- Set up lspconfig.
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
            require('lspconfig')['clangd'].setup {
                capabilities = capabilities
            }
        end
    },

    -- Compile & Debug
    ---- neovim-tasks
    {
        "Shatur/neovim-tasks",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
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
        config = function()
            require('gitsigns').setup()
        end
    }

}
require("lazy").setup(plugins)

require("plugins.barbar")
