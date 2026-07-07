return {
    {
        "folke/neodev.nvim",
        opts = {} ,
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "css-lsp",
                "cssmodules-language-server",
                "emmet-ls",
                "dockerfile-language-server",
                "yaml-language-server",
                "arduino-language-server",
                "codelldb",
                "eslint-lsp",
                "html-lsp",
                "java-language-server",
                "json-lsp",
                "lua-language-server",
                "prettier",
                "black",
                "pyright",
                "rust-analyzer",
                "selene",
                "shfmt",
                "stylua",
                "tailwindcss-language-server",
                "taplo",
                "typescript-language-server",
            },
        },
    },

    {
        "williamboman/mason-lspconfig.nvim",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()

            local enable = vim.lsp.enable

            local lspconfig = vim.lsp.config

            local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            vim.diagnostic.config({
                virtual_text = {
                    prefix = '●',
                },
                severity_sort = true,
                float = {
                    source = "always",
                },
            })

            enable('cssls')
            enable('cssmodules_ls')
            enable('emmet_ls')
            enable('dockerls')
            enable('yamlls')
            enable('arduino_language_server')
            enable('eslint')
            enable('html')
            enable('jdtls')
            lspconfig('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'},
                        },
                    },
                },
            })
            enable('lua_ls')
            enable('pyright')
            enable('rust_analyzer')
            enable('ts_ls')
            enable('tailwindcss')
        end,
    }
}
